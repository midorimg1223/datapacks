#By ZCode —— 亡灵矿工制服：灰色衣服 / 淡灰色裤子 / 黑色鞋子 / 原头颅 + 亡灵之镐
# 组件写法照搬已跑通的 M&M role/monkey/dress.mcfunction：dyed_color=整数、player_head[profile={...}]、armor.head/chest/legs/feet
# 全部 unbreakable={}：永不磨损、永不损坏
# 「不能取下来」= 每 tick 检查：缺哪件补哪件，脱下来的那件同时也被收走 → 既脱不掉，也攒不出第二套

# 头颅（缺件时：先清掉散落的同名件，再戴回去）
execute unless items entity @s armor.head *[custom_data~{Tags:["undead_uniform_head"]}] run clear @s player_head[minecraft:custom_data~{Tags:["undead_uniform_head"]}]
execute unless items entity @s armor.head *[custom_data~{Tags:["undead_uniform_head"]}] run item replace entity @s armor.head with player_head[custom_data={Tags:["undead_uniform_head"]},unbreakable={},profile={properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjYxN2U0M2UzNTIyYzNlNmU5MGY2NWZjMzIwNjFiOWJlZjE1YjRiMzMwNmU2OTQ3ZWRlZmM4ZTU5MTE1MDczMSJ9fX0="}]}]

# 上衣：灰色
execute unless items entity @s armor.chest *[custom_data~{Tags:["undead_uniform_chest"]}] run clear @s leather_chestplate[minecraft:custom_data~{Tags:["undead_uniform_chest"]}]
execute unless items entity @s armor.chest *[custom_data~{Tags:["undead_uniform_chest"]}] run item replace entity @s armor.chest with leather_chestplate[dyed_color=8421504,custom_data={Tags:["undead_uniform_chest"]},unbreakable={}]

# 裤子：淡灰色
execute unless items entity @s armor.legs *[custom_data~{Tags:["undead_uniform_legs"]}] run clear @s leather_leggings[minecraft:custom_data~{Tags:["undead_uniform_legs"]}]
execute unless items entity @s armor.legs *[custom_data~{Tags:["undead_uniform_legs"]}] run item replace entity @s armor.legs with leather_leggings[dyed_color=12632256,custom_data={Tags:["undead_uniform_legs"]},unbreakable={}]

# 鞋子：黑色
execute unless items entity @s armor.feet *[custom_data~{Tags:["undead_uniform_feet"]}] run clear @s leather_boots[minecraft:custom_data~{Tags:["undead_uniform_feet"]}]
execute unless items entity @s armor.feet *[custom_data~{Tags:["undead_uniform_feet"]}] run item replace entity @s armor.feet with leather_boots[dyed_color=0,custom_data={Tags:["undead_uniform_feet"]},unbreakable={}]

# 亡灵之镐：背包 / 主手 / 副手都没有才补一把
# 亡灵之镐：只在"没发过"时发一次
execute if score @s undead_miner.issued matches 1.. run return 0
execute run function monster:undead_miner/pickaxe/give
