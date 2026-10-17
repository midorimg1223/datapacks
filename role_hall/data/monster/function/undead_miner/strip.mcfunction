#By ZCode —— 移除标签时：清掉这个玩家身上所有「亡灵矿工专属」的东西
# 只认带标记的件，绝不碰玩家自己的装备和物品

# 1) 制服四件（身上的 + 背包里散落的）
execute if items entity @s armor.head *[custom_data~{Tags:["undead_uniform_head"]}] run item replace entity @s armor.head with air
execute if items entity @s armor.chest *[custom_data~{Tags:["undead_uniform_chest"]}] run item replace entity @s armor.chest with air
execute if items entity @s armor.legs *[custom_data~{Tags:["undead_uniform_legs"]}] run item replace entity @s armor.legs with air
execute if items entity @s armor.feet *[custom_data~{Tags:["undead_uniform_feet"]}] run item replace entity @s armor.feet with air
clear @s player_head[minecraft:custom_data~{Tags:["undead_uniform_head"]}]
clear @s leather_chestplate[minecraft:custom_data~{Tags:["undead_uniform_chest"]}]
clear @s leather_leggings[minecraft:custom_data~{Tags:["undead_uniform_legs"]}]
clear @s leather_boots[minecraft:custom_data~{Tags:["undead_uniform_feet"]}]

# 2) 亡灵之镐（手上/背包里，一次全清）
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_pickaxe"]}]

# 3) 回魂令（亡魂灯那套，只有亡灵矿工能用）
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["soul_lantern_tp"]}]

# 4) 如果之前是血池归零被切成旁观，恢复回生存
execute if score @s undead_miner.dead matches 1 run gamemode survival @s

# 5) 血池与角色标记清空（重新加标签时从 100 重新开始）
scoreboard players reset @s undead_miner.hp
scoreboard players reset @s undead_miner.issued
scoreboard players reset @s undead_miner.slot
scoreboard players reset @s undead_miner.dmg
scoreboard players reset @s undead_miner.dead
