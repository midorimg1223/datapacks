#By ZCode —— 移除标签时：清掉 steve 专属的东西（只认带标记的件）
execute if items entity @s armor.head *[custom_data~{Tags:["steve_uniform_head"]}] run item replace entity @s armor.head with air
execute if items entity @s armor.chest *[custom_data~{Tags:["steve_uniform_chest"]}] run item replace entity @s armor.chest with air
execute if items entity @s armor.legs *[custom_data~{Tags:["steve_uniform_legs"]}] run item replace entity @s armor.legs with air
execute if items entity @s armor.feet *[custom_data~{Tags:["steve_uniform_feet"]}] run item replace entity @s armor.feet with air
clear @s player_head[minecraft:custom_data~{Tags:["steve_uniform_head"]}]
clear @s leather_chestplate[minecraft:custom_data~{Tags:["steve_uniform_chest"]}]
clear @s leather_leggings[minecraft:custom_data~{Tags:["steve_uniform_legs"]}]
clear @s leather_boots[minecraft:custom_data~{Tags:["steve_uniform_feet"]}]
# 消耗品「肾上腺素」也收走
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}]
# 如果之前是血池归零被切成旁观，恢复回生存
execute if score @s steve.dead matches 1 run gamemode survival @s
# 血池与角色标记清空
scoreboard players reset @s steve.hp
scoreboard players reset @s steve.slot
scoreboard players reset @s steve.dmg
scoreboard players reset @s steve.dead
scoreboard players reset @s steve.spd
scoreboard players reset @s steve.charge
scoreboard players reset @s steve.issued
scoreboard players reset @s steve.charged

