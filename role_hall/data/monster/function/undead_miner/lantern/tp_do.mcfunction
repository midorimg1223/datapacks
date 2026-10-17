#By ZCode —— 传送落点（执行位置 = 灯锚点，@s = 传送的玩家）
# 拆掉这盏灯：方块 + 锚点
kill @e[type=marker,tag=soul_lantern,distance=..1.5]
setblock ~ ~ ~ air

# 把人放到灯上方一格
tp @s ~ ~1 ~

# 消耗回魂令（一次性）
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["soul_lantern_tp"]}] 1
tellraw @s {"text":"你已回到灯笼处","color":"aqua"}
