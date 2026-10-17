#By ZCode —— 放下亡魂灯（执行者 = 使用者，位置已 align 到方块）
setblock ~ ~ ~ minecraft:soul_lantern replace
summon minecraft:marker ~ ~ ~ {Tags:["soul_lantern"]}
# 消耗一盏（不想要消耗就删掉这一行）
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["soul_lantern"]}] 1
# 提示只给亡灵矿工：凡人放灯时完全静默
execute if entity @s[tag=undead_miner] run tellraw @s {"text":"[亡魂灯] 已放下","color":"aqua"}
