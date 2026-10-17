# 近战判定盒（交互实体）· 轻击不再吃无敌帧

## 为什么要这套东西

原来的轻击靠 `minecraft:player_hurt_entity` 触发 —— 它要求"原版命中真的打出了伤害"。
但原版有 **无敌帧**：目标在 10 tick 内挨过同种伤害后，再次命中会被直接忽略（连事件都不产生），
于是连续点击、多人夹击、刚被重击过的目标，轻击都会时有时无。

解决办法：给会被武器打的目标身上挂一个**比它本体稍大的交互实体**（`minecraft:interaction`），
让左键先打在盒子上。盒子不吃伤害、不参与原版战斗，所以`目标完全不会进入无敌帧`。

## 引擎行为（读 26.3 `Interaction` 字节码确认过，不是猜的）

```java
// skipAttackInteraction()
if (entity instanceof Player player) {
    this.attack = new PlayerAction(player.getUUID(), level().getGameTime()); // ① 记录左键
    if (player instanceof ServerPlayer sp)
        CriteriaTriggers.PLAYER_HURT_ENTITY.trigger(...);                    // ② 触发进度
    return !this.getResponse();                                             // ③ 再决定吞不吞
}
```

1. **左键**打盒子 → 写 `attack{player,timestamp}`，**并且照旧触发 `player_hurt_entity`**
   → 两件武器现有的 `light_attack` 进度触发器**不用改**，而且不再依赖"打出伤害"，无敌帧彻底无关
2. **右键**打盒子 → 写 `interaction{player,timestamp}`，但返回 `CONSUME`：手里道具的"使用"不会发生
   → 所以右键在这里自己接：读 `interaction` → 按 UUID 找到玩家 → `hitbox:use_dispatch` 按手持道具分派
   （重击、亡魂灯、回魂令、速度提升、亡马之魂都在里面，指着敌人右键也能正常用）
3. `response:0b` 只影响"吞不吞 + 挥手/音效"，**记录照样写、进度照样触发**
4. 盒子尺寸比本体大一圈（0.9×2.1）：攻击射线永远先碰到盒子，而不是先碰到本体

## 谁会被挂盒子

| 对象 | 条件 |
|---|---|
| 亡灵矿工 / steve | 带 `undead_miner` / `steve` 标签就挂（玩家或生物都行） |
| 其他敌对生物 | 8 格内有拿武器（亡灵之镐 / 平板）的玩家才挂；不想要就删 `tick_dim.mcfunction` 第 3 步 |
| 凡人玩家 | **不挂** —— 他们的伤害走真实血量，挂了会把他们的原版近战全吞掉 |

盒子每 100 tick 全部清掉重挂一次（自愈），主人死亡/换角色时盒子会随主人一起消失。

## 文件

```
data/hitbox/function/
├── load.mcfunction             计分项：hb.at_now / hb.at_last / hb.it_now / hb.it_last / hb.timer
├── tick.mcfunction             主循环（主世界 + 下界 + 末地；自定义维度有注释行）
├── tick_dim.mcfunction         单维度：维护盒子 + 检测左右键（时间闸 5 tick，防旧记录）
├── attach_miner/steve/other    召唤盒子并 ride 到目标身上（盒子骑人，跟着走，不用每 tick 对坐标）
├── attack.mcfunction           盒子被左键：记时间戳 → 宏解析 attack.player → attack_dispatch
├── attack_resolve.mcfunction   宏：UUID → 玩家
├── attack_dispatch.mcfunction  按手持道具转给 undead_pickaxe / tablet 的 light_attack
├── rightclick.mcfunction       盒子被右键：记时间戳 → 宏解析 interaction.player → use_dispatch
├── rightclick_resolve.mcfunction 宏：UUID → 玩家
├── use_dispatch.mcfunction     按手持道具分派（重击 / 亡魂灯 / 回魂令 / 速度提升 / 亡马之魂）
├── reset.mcfunction            自愈：清掉所有盒子
└── test.mcfunction             游戏内自检：/function hitbox:test
```

接线：`role_hall` 的 `minecraft:load` / `minecraft:tick` 标签里加了 `hitbox:load` / `hitbox:tick`。

## 保留的旧路径

`used:` 统计（`undead_pickaxe.rc` / `tablet.rc`）和原版命中触发**都保留**：
- 右键打空处 / 打方块、或者目标没有盒子时，仍然走老路 → 行为不变
- 一次点击只会走其中一条（盒子拦住了就不会有原版命中/统计）→ 不会双触发；
  万一同一 tick 两条都到了，冷却门（`cd_light` / `cd_heavy`）会把第二条挡掉

## 已实测（官方 26.3 服务端）

- 盒子能挂上并跟随：目标实体的 `Passengers` 里就是这个 `interaction`（`0.9×2.1`、`response:0b`、`NoGravity`）
- 模拟左键记录（往盒子写 `attack{player,timestamp}`）→ 血池 **-4**、`cd_light` = 12、`at_last` 更新 ✓
- 模拟右键记录（往盒子写 `interaction{player,timestamp}`）→ 血池 **-8**、`cd_heavy` = 40、`it_last` 更新 ✓
- 中间那条 UUID → 玩家的宏解析（`@e[nbt={UUID:[I;...]}]`）实测可用

> 测试时往盒子里写 NBT 必须**一次写完整的 `{player,timestamp}`**（分两次写会让引擎的编解码报错、字段丢失）；
> 真实游戏里是引擎自己原子写入的，不受影响。

## 注意

1. 盒子是实体，会被 `@e` 通配选择器看到；统一用 `tag=melee_hitbox` 管理，别用无过滤的 `@e` 清场
2. 挂盒子的目标，**原版近战伤害对它无效**（都被盒子接住了）—— 角色的血本来就只走血池，所以没影响
3. 尺寸是统一的 0.9×2.1：玩家/僵尸/骷髅够用，蜘蛛这类扁体型罩不全（罩不全时退回原版命中，不影响功能）
4. 骑马/划船时不建议挂（盒子会跟着载具跑）—— 目前没做特殊处理，发现异常再说
