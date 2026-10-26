# 碎晶展示实体：正弦上下浮动 + 持续自转 + 少量紫色粒子
scoreboard players add #shard.phase mcdd.timer 1
execute if score #shard.phase mcdd.timer matches 60.. run scoreboard players set #shard.phase mcdd.timer 0

# 从正弦步长表取当前 tick 的位移量并应用（同时偏航 +1°）
execute store result storage mcdd:bob i int 1 run scoreboard players get #shard.phase mcdd.timer
function mcdd:shard/bob_select with storage mcdd:bob
function mcdd:shard/bob_apply with storage mcdd:bob

# 每 4 tick 生成 1 个紫色粒子
scoreboard players add #shard.pcount mcdd.timer 1
execute if score #shard.pcount mcdd.timer matches 4.. run scoreboard players set #shard.pcount mcdd.timer 0
execute if score #shard.pcount mcdd.timer matches 1 as @e[type=minecraft:item_display,tag=mcdd_shard] at @s run particle minecraft:dragon_breath ~ ~ ~ 0.3 0.4 0.3 0.01 1

# cm_mortal 玩家进入水平 0.5 格范围即收集（判定点下移到脚部高度）
execute as @e[type=minecraft:item_display,tag=mcdd_shard] at @s positioned ~ ~-1.2 ~ if entity @a[tag=cm_mortal,distance=..0.5] run function mcdd:shard/collect
