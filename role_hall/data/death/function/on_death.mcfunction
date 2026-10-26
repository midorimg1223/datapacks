#By ZCode —— 玩家死亡（@s = 刚死的玩家）
# 幂等：已经进入幽灵状态就不再重复走死亡流程
execute if entity @s[tag=spectator] run return 0
# 1) 记录死亡前拥有的角色 tag（30 秒后要还原）
scoreboard players set @s death.was_miner 0
scoreboard players set @s death.was_steve 0
scoreboard players set @s death.was_mortal 0
execute if entity @s[tag=undead_miner] run scoreboard players set @s death.was_miner 1
execute if entity @s[tag=steve] run scoreboard players set @s death.was_steve 1
execute if entity @s[tag=mortal] run scoreboard players set @s death.was_mortal 1

# 2) 记录死亡前的游戏模式（0 生存 / 1 创造 / 2 冒险 / 3 旁观）
scoreboard players set @s death.gm 0
execute if entity @s[gamemode=creative] run scoreboard players set @s death.gm 1
execute if entity @s[gamemode=adventure] run scoreboard players set @s death.gm 2
execute if entity @s[gamemode=spectator] run scoreboard players set @s death.gm 3

# 3) 30 秒倒计时
scoreboard players set @s death.timer 600

# 4) 变成幽灵：加旁观者 tag + 隐身 + 冒险模式
tag @s add spectator
effect give @s minecraft:invisibility infinite 0 true
gamemode adventure @s

# 5) 收走武器（不给打人的机会），血池回满（也避免"矿工血池 0 直接倒地"的冲突）
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_pickaxe"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_pickaxe"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["tablet"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["tablet"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}]
clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}]
# 武器收走了，"已发放"标记也得清掉：否则重生后角色 tick 以为发过了，永远不再补发
scoreboard players reset @s undead_miner.issued
scoreboard players reset @s steve.issued
# 衣服也收掉：隐身效果不隐藏盔甲，留着就会变成"漂浮的制服"
# 只收带制服标记的件，不会动玩家自己的装备；重生时角色 tick 会自动重新发放
execute if items entity @s armor.head *[custom_data~{Tags:["undead_uniform_head"]}] run item replace entity @s armor.head with air
execute if items entity @s armor.chest *[custom_data~{Tags:["undead_uniform_chest"]}] run item replace entity @s armor.chest with air
execute if items entity @s armor.legs *[custom_data~{Tags:["undead_uniform_legs"]}] run item replace entity @s armor.legs with air
execute if items entity @s armor.feet *[custom_data~{Tags:["undead_uniform_feet"]}] run item replace entity @s armor.feet with air
execute if items entity @s armor.head *[custom_data~{Tags:["steve_uniform_head"]}] run item replace entity @s armor.head with air
execute if items entity @s armor.chest *[custom_data~{Tags:["steve_uniform_chest"]}] run item replace entity @s armor.chest with air
execute if items entity @s armor.legs *[custom_data~{Tags:["steve_uniform_legs"]}] run item replace entity @s armor.legs with air
execute if items entity @s armor.feet *[custom_data~{Tags:["steve_uniform_feet"]}] run item replace entity @s armor.feet with air
execute if score @s undead_miner.hp matches -1000000.. run scoreboard players set @s undead_miner.hp 250
execute if score @s steve.hp matches -1000000.. run scoreboard players set @s steve.hp 150
scoreboard players set @s undead_miner.dead 0
scoreboard players set @s steve.dead 0

# 6) 给死者：You Are Dead + 只读自己的攻击者记录（不再用"附近谁有击杀标记"）
title @s times 10 100 20
execute at @s run playsound mcdd:lifelose master @s ~ ~ ~ 1 1
title @s title [{"text":"You Are Dead","color":"dark_red","bold":true}]
tag @s add death_victim
execute store result storage death:me slot int 1 run scoreboard players get @s death.attacker_slot
execute if score @s death.attacker_kind matches 1 if score @s death.attacker_ttl matches 1.. run function death:msg_miner with storage death:me
execute if score @s death.attacker_kind matches 2 if score @s death.attacker_ttl matches 1.. run function death:msg_steve with storage death:me
execute unless score @s death.attacker_ttl matches 1.. run function death:msg_fallback
tag @s remove death_victim
scoreboard players reset @s death.attacker_ttl
