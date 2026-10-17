#By ZCode —— 亡灵矿工传送到「正暴露着凡人」的亡魂灯
# 用法：/trigger soul_lantern.tp（不需要 op）或 /function monster:undead_miner/lantern/tp
execute unless entity @s[tag=undead_miner] run tellraw @s {"text":"[亡魂灯] 只有亡灵矿工可以使用传送","color":"red"}
execute if entity @s[tag=undead_miner] unless entity @e[type=marker,tag=soul_lantern_active] run tellraw @s {"text":"[亡魂灯] 现在没有暴露的亡魂灯","color":"gray"}
execute if entity @s[tag=undead_miner] if entity @e[type=marker,tag=soul_lantern_active] at @e[type=marker,tag=soul_lantern_active,sort=nearest,limit=1] run function monster:undead_miner/lantern/tp_do
