#By ZCode —— 亡灵矿工血池归零
# 玩家：交给统一的死亡系统（深红 You Are Dead + 幽灵 30 秒 + 还原死亡前的 tag）
#       血池会在死亡处理里回满，所以下一 tick 不会再次触发倒地
execute if entity @s[type=minecraft:player] run function death:on_death
# 生物没有"幽灵"概念，直接倒下
execute unless entity @s[type=minecraft:player] run tellraw @a[distance=..64] [{"text":"[亡灵矿工] ","color":"red"},{"selector":"@s"},{"text":" 已倒下","color":"gray"}]
execute unless entity @s[type=minecraft:player] run kill @s
