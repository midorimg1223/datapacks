#By ZCode —— 其它维度（当前维度由 tick 原生上下文处理）
execute in minecraft:the_nether run function monster:undead_miner/lantern/tick_dim
execute in minecraft:the_end run function monster:undead_miner/lantern/tick_dim
# ↓ 如果你地图把人放在自定义维度里（比如 M&M 的 game:debug / game:map_01 / game:map_03）
#   就把对应那行的注释去掉；维度不存在时会每 tick 在日志里报错，别乱开。
# execute in game:debug run function monster:undead_miner/lantern/tick_dim
# execute in game:map_01 run function monster:undead_miner/lantern/tick_dim
# execute in game:map_03 run function monster:undead_miner/lantern/tick_dim
