#By ZCode —— 单维度主逻辑（执行位置 = 该维度的原点，不依赖玩家坐标）

# 0) 亡灵矿工可以用 /trigger soul_lantern.tp 传送（函数要 op，trigger 不用）
scoreboard players enable @a[tag=undead_miner] soul_lantern.tp
execute as @a[scores={soul_lantern.tp=1..}] run function monster:undead_miner/lantern/tp
scoreboard players reset @a[scores={soul_lantern.tp=1..}] soul_lantern.tp

# 1) 右键分派：拿亡魂灯 -> 原地放灯；拿回魂令 -> 传送到暴露中的灯
#    （两件都是诡异菌钓竿，共用一个 used 统计，靠 custom_data 标签区分）
execute as @a[scores={soul_lantern.rc=1..}] if items entity @s weapon.mainhand *[custom_data~{Tags:["soul_lantern"]}] at @s align xyz run function monster:undead_miner/lantern/place
execute as @a[scores={soul_lantern.rc=1..}] if items entity @s weapon.mainhand *[custom_data~{Tags:["soul_lantern_tp"]}] run function monster:undead_miner/lantern/tp
scoreboard players reset @a[scores={soul_lantern.rc=1..}] soul_lantern.rc

# 2) 灯被拆掉/被替换 -> 移除锚点
execute as @e[type=marker,tag=soul_lantern] at @s unless block ~ ~ ~ minecraft:soul_lantern run kill @s

# 3) 逐盏灯：光环 + 暴露 + 报点
execute as @e[type=marker,tag=soul_lantern] at @s run function monster:undead_miner/lantern/lantern

# 4) 丢不掉：两件道具被丢出后立刻收回
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["soul_lantern"]}}}}] at @s if entity @p[distance=..8] run function monster:undead_miner/lantern/retrieve_lantern
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["soul_lantern_tp"]}}}}] at @s if entity @p[distance=..8] run function monster:undead_miner/lantern/retrieve_tp
