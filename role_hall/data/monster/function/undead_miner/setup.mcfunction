#By ZCode —— 初始化一个亡灵矿工（@s）
# 方案 A：满级抗性让原版伤害进不来，原版心永远满；血量只由上报扣
scoreboard players set @s undead_miner.hp 250
scoreboard players set @s undead_miner.dead 0
effect give @s resistance infinite 9 true
effect give @s instant_health 1 20 true
execute if entity @s[type=minecraft:player] run function monster:undead_miner/assign
execute if entity @s[type=minecraft:player] run function monster:undead_miner/gear
execute if entity @s[type=minecraft:player] run tellraw @s [{"text":"[生命条] ","color":"red"},{"text":"生命值 250，原版伤害已屏蔽，制服已锁死","color":"gray"}]
