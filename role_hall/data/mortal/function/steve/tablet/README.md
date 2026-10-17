# 平板 · 轻击 / 重击（steve 的武器）

和亡灵之镐同一套架构（轻击 = 原版左键 + 进度触发器；重击 = 右键 + `used` 统计/判定盒），数值不同。

| 动作 | 触发 | 伤害 | 间隔 |
|---|---|---|---|
| 轻击 | 左键打中实体 | 10（原版 1 + 函数补 9） | 0.5 秒 = 10 tick |
| 重击 | 右键 | 15 | 1.5 秒 = 30 tick |

## 文件

```
data/tablet/
├── advancement/light_hit.json     轻击触发器（player_hurt_entity）
└── function/
    ├── load.mcfunction            计分项：rc / cd_light / cd_heavy / dmg(临时)
    ├── tick.mcfunction            冷却递减 + 右键分派 + 攻速处理 + 收发平板
    ├── use.mcfunction             右键分派：手里是平板才继续
    ├── heavy_attack.mcfunction    重击入口：冷却中静默
    ├── heavy_effect.mcfunction    重击本体（15 / 30 tick）
    ├── light_attack.mcfunction    轻击入口：撤进度、查冷却、查手持
    ├── light_effect.mcfunction    轻击本体（10 / 10 tick）
    ├── pool_damage.mcfunction     血池记账（数值由调用方写进 tablet.dmg）
    ├── pool_hit.mcfunction        把 undead_miner.dmg 扣进亡灵矿工血池
    └── give.mcfunction            发平板（+ 设 steve.issued）
```

## 伤害怎么走

1. `tag=undead_miner` → 写 `tablet.dmg` 再走 `tablet:pool_damage`（内部会调 `tablet:pool_hit`）
2. `tag=steve` → 同样进 `tablet:pool_damage`，转写 `steve.dmg` 并调 steve 包的 `steve:pool_hit`
3. 其他目标 → `/damage … minecraft:generic by <攻击者>`

`pool_damage` 还会替攻击者打上 `death.killflag`（角色是"血池归零"倒下，原版不会触发击杀进度），
这样死亡提示和击杀广播才认得出来是谁杀的。

## 要改数值就改这几行

- 轻击伤害 10 → `light_effect.mcfunction`：其他目标那行的 `9`（= 10 − 原版 1）和血池那两行的 `tablet.dmg 10`
- 轻击间隔 0.5 秒 → `light_effect.mcfunction` 第一行 `tablet.cd_light 10`
- 重击伤害 15 → `heavy_effect.mcfunction` 的 `damage … 15 …` 和血池那两行的 `tablet.dmg 15`
- 重击间隔 1.5 秒 → `heavy_effect.mcfunction` 第一行 `tablet.cd_heavy 30`
- 判定范围 → 重击 `anchored eyes positioned ^ ^ ^2` + `distance=..2.6`；轻击 `^ ^ ^1.5` + `distance=..2.2`
