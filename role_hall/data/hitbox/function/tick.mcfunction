#By ZCode —— 近战判定盒 主循环（tick 函数只在主世界执行，其余维度自己进）
function hitbox:tick_dim
execute in minecraft:the_nether run function hitbox:tick_dim
execute in minecraft:the_end run function hitbox:tick_dim
# 自定义维度（有的话把对应行注释去掉；维度不存在会每 tick 在日志里报错）
# execute in game:map_01 run function hitbox:tick_dim
