#By ZCode —— 近战判定盒（交互实体）· 初始化
# 为什么要有它：原版左键命中会吃无敌帧（10 tick 内同种伤害不算命中，也就不会触发 player_hurt_entity），
# 所以"轻击"会时有时无。办法：给目标身上挂一个比它稍大的交互实体，让左键先打在这个盒子上。
#
# 引擎行为（读 26.3 的 Interaction 字节码确认过）：
#   左键打盒子 → 写 attack{player,timestamp} + 触发 player_hurt_entity（顺序在"吞掉攻击"之前，所以照旧会触发）
#   右键打盒子 → 写 interaction{player,timestamp}，但返回 CONSUME：手里的道具"使用"不会发生
#                → 所以右键要在这里自己接：读 interaction → 找到玩家 → 按手持道具分派（和各自 tick 的 used 统计那条路一致）
#   盒子不吃伤害、没有重力、不参与原版战斗，只负责"接住点击"
scoreboard objectives add hb.at_now dummy
scoreboard objectives add hb.at_last dummy
scoreboard objectives add hb.it_now dummy
scoreboard objectives add hb.it_last dummy
scoreboard objectives add hb.timer dummy
