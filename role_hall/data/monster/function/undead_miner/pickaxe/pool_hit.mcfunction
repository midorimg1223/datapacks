#By ZCode —— 把 undead_miner.dmg 扣进亡灵矿工的血池（@s = 亡灵矿工）
# 自包含：不跨包引用 role_hall 的函数
# 血池没初始化就先补 250（玩家和生物都能用）
execute unless score @s undead_miner.hp matches -1000000.. run scoreboard players set @s undead_miner.hp 250
scoreboard players operation @s undead_miner.hp -= @s undead_miner.dmg
# 受击反馈：角色带满级抗性，血不会掉；但 /damage 仍会触发原版受伤动作 + 受击音效
#   0.01 的伤害会被抗性完全吸收；配合 bypasses_cooldown 标签，连续命中也能每次都红闪
damage @s 0.01 minecraft:generic
scoreboard players set @s undead_miner.dmg 0
