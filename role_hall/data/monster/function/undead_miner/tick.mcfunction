#By ZCode —— 生命条 · 每 tick（方案 A）
# 支持「玩家」和「生物」两种亡灵矿工；血条只有玩家能看，所以只有玩家分配槽位

# 1) 血池初始化 100（玩家/生物都行）
execute as @e[tag=undead_miner] unless score @s undead_miner.hp matches -1000000.. run scoreboard players set @s undead_miner.hp 250
# 2) 满级抗性 + 每 tick 补满原版心：原版血条永远满，血只走血池
execute as @e[tag=undead_miner] run effect give @s resistance infinite 9 true
execute as @e[tag=undead_miner] run attribute @s knockback_resistance base set 1
execute as @e[tag=undead_miner] run effect give @s instant_health 1 20 true
# 3) 血池归零 -> 倒下（标记位保证只触发一次）
execute as @e[tag=undead_miner,scores={undead_miner.hp=..0}] at @s unless score @s undead_miner.dead matches 1 run function monster:undead_miner/down
# 4) 玩家：分配槽位 / 移除标签后释放槽位
execute as @a[tag=undead_miner] unless score @s undead_miner.slot matches 1.. run function monster:undead_miner/assign
execute as @a[tag=!undead_miner,scores={undead_miner.slot=1..}] run scoreboard players set @s undead_miner.slot 0
execute as @a[tag=!undead_miner,tag=!steve] run effect clear @s resistance
execute as @a[tag=!undead_miner,tag=!steve] run attribute @s knockback_resistance base set 0

# 5) bossbar 数值与观众同步（每个槽位一条，只有本人看得见）
bossbar set undead_miner1 value 0
bossbar set undead_miner1 players @a[scores={undead_miner.slot=1},tag=!spectator]
execute as @a[scores={undead_miner.slot=1}] store result bossbar undead_miner1 value run scoreboard players get @s undead_miner.hp
bossbar set undead_miner2 value 0
bossbar set undead_miner2 players @a[scores={undead_miner.slot=2},tag=!spectator]
execute as @a[scores={undead_miner.slot=2}] store result bossbar undead_miner2 value run scoreboard players get @s undead_miner.hp
bossbar set undead_miner3 value 0
bossbar set undead_miner3 players @a[scores={undead_miner.slot=3},tag=!spectator]
execute as @a[scores={undead_miner.slot=3}] store result bossbar undead_miner3 value run scoreboard players get @s undead_miner.hp
bossbar set undead_miner4 value 0
bossbar set undead_miner4 players @a[scores={undead_miner.slot=4},tag=!spectator]
execute as @a[scores={undead_miner.slot=4}] store result bossbar undead_miner4 value run scoreboard players get @s undead_miner.hp
bossbar set undead_miner5 value 0
bossbar set undead_miner5 players @a[scores={undead_miner.slot=5},tag=!spectator]
execute as @a[scores={undead_miner.slot=5}] store result bossbar undead_miner5 value run scoreboard players get @s undead_miner.hp
bossbar set undead_miner6 value 0
bossbar set undead_miner6 players @a[scores={undead_miner.slot=6},tag=!spectator]
execute as @a[scores={undead_miner.slot=6}] store result bossbar undead_miner6 value run scoreboard players get @s undead_miner.hp

# 6) 制服 + 武器（放最后：万一出问题也不会拖累血条和伤害判定）
execute as @a[tag=undead_miner,tag=!spectator] run function monster:undead_miner/gear
execute as @a[tag=!undead_miner] run function monster:undead_miner/strip

# 血条名称：血量 (剩余/总共)
data modify storage death:bar undead_miner1.bar set value "undead_miner1"
data modify storage death:bar undead_miner2.bar set value "undead_miner2"
data modify storage death:bar undead_miner3.bar set value "undead_miner3"
data modify storage death:bar undead_miner4.bar set value "undead_miner4"
data modify storage death:bar undead_miner5.bar set value "undead_miner5"
data modify storage death:bar undead_miner6.bar set value "undead_miner6"
execute as @a[scores={undead_miner.slot=1}] store result storage death:bar undead_miner1.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=1}] run function death:bar_miner with storage death:bar undead_miner1
execute as @a[scores={undead_miner.slot=2}] store result storage death:bar undead_miner2.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=2}] run function death:bar_miner with storage death:bar undead_miner2
execute as @a[scores={undead_miner.slot=3}] store result storage death:bar undead_miner3.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=3}] run function death:bar_miner with storage death:bar undead_miner3
execute as @a[scores={undead_miner.slot=4}] store result storage death:bar undead_miner4.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=4}] run function death:bar_miner with storage death:bar undead_miner4
execute as @a[scores={undead_miner.slot=5}] store result storage death:bar undead_miner5.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=5}] run function death:bar_miner with storage death:bar undead_miner5
execute as @a[scores={undead_miner.slot=6}] store result storage death:bar undead_miner6.hp int 1 run scoreboard players get @s undead_miner.hp
execute as @a[scores={undead_miner.slot=6}] run function death:bar_miner with storage death:bar undead_miner6

# 丢出去的制服件也清掉（每 tick 都会补发，留着就会越堆越多）
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["undead_uniform_head"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["undead_uniform_chest"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["undead_uniform_legs"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["undead_uniform_feet"]}}}}] run kill @s
