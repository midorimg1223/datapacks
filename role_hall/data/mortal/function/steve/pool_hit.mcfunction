#By ZCode —— 把 steve.dmg 扣进 steve 的血池（@s = steve）
execute unless score @s steve.hp matches -1000000.. run scoreboard players set @s steve.hp 150
scoreboard players operation @s steve.hp -= @s steve.dmg
# 受击反馈：角色带满级抗性，血不会掉；但 /damage 仍会触发原版受伤动作 + 受击音效
damage @s 0.01 minecraft:generic
scoreboard players set @s steve.dmg 0
