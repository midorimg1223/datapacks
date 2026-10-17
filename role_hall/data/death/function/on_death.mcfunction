#By ZCode —— 玩家死亡（@s = 刚死的玩家）
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

# 6) 给死者：深红 You Are Dead + 提示"被谁击杀"（只走屏幕中央的标题，聊天栏不刷屏）
title @s times 10 100 20
# 被击杀音效（给死者；音效来自资源包 undead_pickaxe_rp 的 lifelose）
execute at @s run playsound mcdd:lifelose master @s ~ ~ ~ 1 1
title @s title [{"text":"You Are Dead","color":"dark_red","bold":true}]
execute if entity @a[tag=!spectator,scores={death.killflag=1}] run title @s subtitle [{"text":"被 ","color":"red"},{"selector":"@a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1]","color":"white","bold":true},{"text":" 击杀","color":"red"}]
execute unless entity @a[tag=!spectator,scores={death.killflag=1}] run title @s subtitle [{"text":"被环境或生物击杀","color":"gray"}]

# 7) 给击杀者：大标题「击杀！」+ 副标题「XXX 被击杀」（XXX = 刚死的玩家）
#    做法：先把死者临时打个标签，击杀者那边的副标题就能用选择器把死者名字渲染出来
tag @s add death_victim
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s times 5 40 10
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s title [{"text":"击杀！","color":"dark_red","bold":true}]
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s subtitle [{"selector":"@a[tag=death_victim]","color":"white","bold":true},{"text":" 被击杀","color":"gray"}]
# 聊天栏广播：XXX 击杀了 XXX（用选择器渲染名字，不用拼字符串）
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run tellraw @a [{"selector":"@s","color":"red"},{"text":" 击杀了 ","color":"gray"},{"selector":"@a[tag=death_victim]","color":"white"}]
# 击杀音效（给击杀者；音效来自资源包 undead_pickaxe_rp 的 streak1）
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] at @s run playsound mcdd:streak1 master @s ~ ~ ~ 1 1
tag @s remove death_victim
