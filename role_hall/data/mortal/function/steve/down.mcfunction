#By ZCode —— steve 血池归零
# 玩家：交给统一的死亡系统（深红 You Are Dead + 幽灵 30 秒 + 还原死亡前的 tag）
execute if entity @s[type=minecraft:player] run function death:on_death
# 生物没有"幽灵"概念，直接倒下
execute unless entity @s[type=minecraft:player] run tellraw @a[distance=..64] [{"text":"[steve] ","color":"red"},{"selector":"@s"},{"text":" 已倒下","color":"gray"}]
execute unless entity @s[type=minecraft:player] run kill @s
