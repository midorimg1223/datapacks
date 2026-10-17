#By ZCode —— steve 制服：黑色上衣 / 黑色裤子 / 棕色鞋子 / 史蒂夫头颅
# 全部 unbreakable={}；缺哪件补哪件，脱下来的那件同时被收走 → 取不下来
# 头颅不给 profile = 用原版默认皮肤（Steve）

# 头颅：史蒂夫
execute unless items entity @s armor.head *[custom_data~{Tags:["steve_uniform_head"]}] run clear @s player_head[minecraft:custom_data~{Tags:["steve_uniform_head"]}]
execute unless items entity @s armor.head *[custom_data~{Tags:["steve_uniform_head"]}] run item replace entity @s armor.head with player_head[custom_data={Tags:["steve_uniform_head"]},unbreakable={}]

# 上衣：全黑
execute unless items entity @s armor.chest *[custom_data~{Tags:["steve_uniform_chest"]}] run clear @s leather_chestplate[minecraft:custom_data~{Tags:["steve_uniform_chest"]}]
execute unless items entity @s armor.chest *[custom_data~{Tags:["steve_uniform_chest"]}] run item replace entity @s armor.chest with leather_chestplate[dyed_color=2631720,custom_data={Tags:["steve_uniform_chest"]},unbreakable={}]

# 裤子：全黑
execute unless items entity @s armor.legs *[custom_data~{Tags:["steve_uniform_legs"]}] run clear @s leather_leggings[minecraft:custom_data~{Tags:["steve_uniform_legs"]}]
execute unless items entity @s armor.legs *[custom_data~{Tags:["steve_uniform_legs"]}] run item replace entity @s armor.legs with leather_leggings[dyed_color=2631720,custom_data={Tags:["steve_uniform_legs"]},unbreakable={}]

# 鞋子：棕色（皮革本色，不染色即可）
execute unless items entity @s armor.feet *[custom_data~{Tags:["steve_uniform_feet"]}] run clear @s leather_boots[minecraft:custom_data~{Tags:["steve_uniform_feet"]}]
execute unless items entity @s armor.feet *[custom_data~{Tags:["steve_uniform_feet"]}] run item replace entity @s armor.feet with leather_boots[custom_data={Tags:["steve_uniform_feet"]},unbreakable={}]
