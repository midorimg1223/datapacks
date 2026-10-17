#By ZCode —— 扣血入口（@s = steve）
# 约定：伤害源先把数值写进 @s 的 steve.dmg，再调用本函数
#   execute as <目标> run scoreboard players set @s steve.dmg 30
#   execute as <目标> run function mortal:steve/hurt
execute unless score @s steve.hp matches -1000000.. run scoreboard players set @s steve.hp 150
scoreboard players operation @s steve.hp -= @s steve.dmg
scoreboard players set @s steve.dmg 0
