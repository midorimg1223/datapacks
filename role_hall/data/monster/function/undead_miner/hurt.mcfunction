#By ZCode —— 扣血入口（@s = 亡灵矿工）
# 约定：伤害源先把数值写进 @s 的 undead_miner.dmg，再调用本函数
#   scoreboard players set @s undead_miner.dmg 30
#   execute as <目标> run function monster:undead_miner/hurt
scoreboard players operation @s undead_miner.hp -= @s undead_miner.dmg
scoreboard players set @s undead_miner.dmg 0
