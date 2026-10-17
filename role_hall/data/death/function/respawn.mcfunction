#By ZCode —— 30 秒到：还原死亡前的状态（@s = 幽灵）
# 1) 脱掉幽灵状态
tag @s remove spectator
effect clear @s minecraft:invisibility

# 2) 还原游戏模式
execute if score @s death.gm matches 0 run gamemode survival @s
execute if score @s death.gm matches 1 run gamemode creative @s
execute if score @s death.gm matches 2 run gamemode adventure @s
execute if score @s death.gm matches 3 run gamemode spectator @s

# 3) 还原死亡前的角色 tag（装备/血条/武器会由各角色自己的 tick 自动补回）
execute if score @s death.was_miner matches 1 run tag @s add undead_miner
execute if score @s death.was_steve matches 1 run tag @s add steve
execute if score @s death.was_mortal matches 1 run tag @s add mortal

# 4) 清掉记录
scoreboard players reset @s death.timer
scoreboard players reset @s death.gm
scoreboard players reset @s death.was_miner
scoreboard players reset @s death.was_steve
scoreboard players reset @s death.was_mortal

# 5) 只显示「重生」两个字
title @s times 5 30 10
title @s title [{"text":"重生","color":"green","bold":true}]
