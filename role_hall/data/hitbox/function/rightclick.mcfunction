#By ZCode —— 盒子被右键（@s = 盒子）
# 盒子会吞掉"道具使用"，所以指着敌人右键时的重击/道具要在这里补上
# 记下时间戳防重复；UUID 经 storage 传给宏（宏变量名不能带点）
scoreboard players operation @s hb.it_last = @s hb.it_now
data modify storage hitbox:mac uuid set from entity @s interaction.player
execute if score @s hb.it_now > #hb.time hb.timer run function hitbox:rightclick_resolve with storage hitbox:mac
