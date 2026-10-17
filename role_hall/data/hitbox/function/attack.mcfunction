#By ZCode —— 盒子被左键（@s = 盒子）
# 记下时间戳防重复；把 attack.player 的 UUID 复制进 storage（宏变量名不能带点，所以不能直接 $(attack.player)）
# 然后交给对应武器的轻击入口（light_attack 自己会：撤进度、查冷却、查手持道具 —— 和原版命中那条路完全复用）
scoreboard players operation @s hb.at_last = @s hb.at_now
data modify storage hitbox:mac uuid set from entity @s attack.player
execute if score @s hb.at_now > #hb.time hb.timer run function hitbox:attack_resolve with storage hitbox:mac
