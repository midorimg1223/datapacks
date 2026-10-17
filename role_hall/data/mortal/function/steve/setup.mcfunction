#By ZCode —— 初始化一个 steve（@s）
scoreboard players set @s steve.hp 150
scoreboard players set @s steve.dead 0
effect give @s resistance infinite 9 true
effect give @s instant_health 1 20 true
execute if entity @s[type=minecraft:player] run function mortal:steve/assign
execute if entity @s[type=minecraft:player] run function mortal:steve/gear
execute if entity @s[type=minecraft:player] run tellraw @s [{"text":"[steve] ","color":"white"},{"text":"生命值 150，原版伤害已屏蔽，制服已锁死","color":"gray"}]
