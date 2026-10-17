#By ZCode —— steve 角色 · 每 tick（与亡灵矿工各自独立）
# 1) 血池初始化 100
execute as @e[tag=steve] unless score @s steve.hp matches -1000000.. run scoreboard players set @s steve.hp 150
# 2) 满级抗性 + 补满原版心：原版血条永远满，血只走血池
execute as @e[tag=steve] run effect give @s resistance infinite 9 true
execute as @e[tag=steve] run attribute @s knockback_resistance base set 1
execute as @e[tag=steve] run effect give @s instant_health 1 20 true
# 3) 归零 -> 倒下（标记位保证只触发一次）
execute as @e[tag=steve,scores={steve.hp=..0}] at @s unless score @s steve.dead matches 1 run function mortal:steve/down
# 4) 玩家：分配槽位 / 移除标签后释放
execute as @a[tag=steve] unless score @s steve.slot matches 1.. run function mortal:steve/assign
execute as @a[tag=!steve,scores={steve.slot=1..}] run scoreboard players set @s steve.slot 0
execute as @a[tag=!steve,tag=!undead_miner] run effect clear @s resistance
execute as @a[tag=!steve,tag=!undead_miner] run attribute @s knockback_resistance base set 0

# 5) 血条同步（每个槽位一条，只有本人看得见）
bossbar set steve1 value 0
bossbar set steve1 players @a[scores={steve.slot=1},tag=!spectator]
execute as @a[scores={steve.slot=1}] store result bossbar steve1 value run scoreboard players get @s steve.hp
bossbar set steve2 value 0
bossbar set steve2 players @a[scores={steve.slot=2},tag=!spectator]
execute as @a[scores={steve.slot=2}] store result bossbar steve2 value run scoreboard players get @s steve.hp
bossbar set steve3 value 0
bossbar set steve3 players @a[scores={steve.slot=3},tag=!spectator]
execute as @a[scores={steve.slot=3}] store result bossbar steve3 value run scoreboard players get @s steve.hp
bossbar set steve4 value 0
bossbar set steve4 players @a[scores={steve.slot=4},tag=!spectator]
execute as @a[scores={steve.slot=4}] store result bossbar steve4 value run scoreboard players get @s steve.hp
bossbar set steve5 value 0
bossbar set steve5 players @a[scores={steve.slot=5},tag=!spectator]
execute as @a[scores={steve.slot=5}] store result bossbar steve5 value run scoreboard players get @s steve.hp
bossbar set steve6 value 0
bossbar set steve6 players @a[scores={steve.slot=6},tag=!spectator]
execute as @a[scores={steve.slot=6}] store result bossbar steve6 value run scoreboard players get @s steve.hp

# 6) 使用「速度提升」：任何人都能用，所以不筛标签
#    at @s 不能少（tick 执行位置是世界原点）

# 6a) 「速度提升」的加速计时：130 tick = 6.5 秒，到点自动收掉
scoreboard players remove @a[scores={steve.spd=1..}] steve.spd 1
effect clear @a[scores={steve.spd=..0}] minecraft:speed
scoreboard players reset @a[scores={steve.spd=..0}] steve.spd

# 7) 制服（放最后：出问题也不拖累血条和道具）
execute as @a[tag=steve,tag=!spectator] run function mortal:steve/gear
execute as @a[tag=!steve] run function mortal:steve/strip

# 血条名称：血量 (剩余/总共)
data modify storage death:bar steve1.bar set value "steve1"
data modify storage death:bar steve2.bar set value "steve2"
data modify storage death:bar steve3.bar set value "steve3"
data modify storage death:bar steve4.bar set value "steve4"
data modify storage death:bar steve5.bar set value "steve5"
data modify storage death:bar steve6.bar set value "steve6"
execute as @a[scores={steve.slot=1}] store result storage death:bar steve1.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=1}] run function death:bar_steve with storage death:bar steve1
execute as @a[scores={steve.slot=2}] store result storage death:bar steve2.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=2}] run function death:bar_steve with storage death:bar steve2
execute as @a[scores={steve.slot=3}] store result storage death:bar steve3.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=3}] run function death:bar_steve with storage death:bar steve3
execute as @a[scores={steve.slot=4}] store result storage death:bar steve4.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=4}] run function death:bar_steve with storage death:bar steve4
execute as @a[scores={steve.slot=5}] store result storage death:bar steve5.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=5}] run function death:bar_steve with storage death:bar steve5
execute as @a[scores={steve.slot=6}] store result storage death:bar steve6.hp int 1 run scoreboard players get @s steve.hp
execute as @a[scores={steve.slot=6}] run function death:bar_steve with storage death:bar steve6

# 丢出去的制服件也清掉（每 tick 都会补发，留着就会越堆越多）
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["steve_uniform_head"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["steve_uniform_chest"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["steve_uniform_legs"]}}}}] run kill @s
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["steve_uniform_feet"]}}}}] run kill @s

# 充能满 100 -> 释放加速并清零

# 充能条（和血条共用同一套槽位，幽灵不显示）
bossbar set steve_charge1 players @a[scores={steve.slot=1},tag=!spectator]
execute as @a[scores={steve.slot=1}] store result storage death:charge steve1.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=1}] run function death:bar_charge with storage death:charge steve1
bossbar set steve_charge2 players @a[scores={steve.slot=2},tag=!spectator]
execute as @a[scores={steve.slot=2}] store result storage death:charge steve2.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=2}] run function death:bar_charge with storage death:charge steve2
bossbar set steve_charge3 players @a[scores={steve.slot=3},tag=!spectator]
execute as @a[scores={steve.slot=3}] store result storage death:charge steve3.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=3}] run function death:bar_charge with storage death:charge steve3
bossbar set steve_charge4 players @a[scores={steve.slot=4},tag=!spectator]
execute as @a[scores={steve.slot=4}] store result storage death:charge steve4.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=4}] run function death:bar_charge with storage death:charge steve4
bossbar set steve_charge5 players @a[scores={steve.slot=5},tag=!spectator]
execute as @a[scores={steve.slot=5}] store result storage death:charge steve5.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=5}] run function death:bar_charge with storage death:charge steve5
bossbar set steve_charge6 players @a[scores={steve.slot=6},tag=!spectator]
execute as @a[scores={steve.slot=6}] store result storage death:charge steve6.hp int 1 run scoreboard players get @s steve.charge
execute as @a[scores={steve.slot=6}] run function death:bar_charge with storage death:charge steve6
execute as @a[tag=steve,scores={steve.charge=100..}] at @s unless score @s steve.charged matches 1 run function mortal:steve/charge_release

# 清掉旧基座（诡异菌钓竿）的速度提升，避免玩家拿着用不了
clear @a[tag=steve] warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}]
