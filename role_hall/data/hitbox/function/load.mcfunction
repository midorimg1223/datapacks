#By ZCode —— 近战判定盒（交互实体）· 初始化
# 给目标身上挂一个比它稍大的交互实体，让左键先打在盒子上，从而绕开原版无敌帧。
# 26.3 引擎行为（字节码确认）：
#   左键打盒子 → 写 attack{player,timestamp} + 触发 player_hurt_entity
#   右键打盒子 → 写 interaction{player,timestamp}，但会吞掉道具"使用" → 由 use_dispatch 自己分派
# 注意：原版 /ride 禁止把玩家当坐骑（ERROR_MOUNTING_PLAYER），所以盒子不再骑人，
#      改成 hb.key（角色槽位号）+ 每 tick tp 跟随。
scoreboard objectives add hb.at_now dummy
scoreboard objectives add hb.at_last dummy
scoreboard objectives add hb.it_now dummy
scoreboard objectives add hb.it_last dummy
scoreboard objectives add hb.timer dummy
# 盒子记的"主人槽位号"（1~6），用来每 tick 把盒子 tp 到对应玩家
scoreboard objectives add hb.key dummy
