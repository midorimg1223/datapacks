#By ZCode —— 把 undead_miner.dmg 扣进亡灵矿工的血池（@s = 亡灵矿工）
execute unless score @s undead_miner.hp matches -1000000.. run scoreboard players set @s undead_miner.hp 250
scoreboard players operation @s undead_miner.hp -= @s undead_miner.dmg
# 受击反馈：角色带满级抗性，血不会掉；但 /damage 仍会触发原版受伤动作 + 受击音效
damage @s 0.01 minecraft:generic
scoreboard players set @s undead_miner.dmg 0
