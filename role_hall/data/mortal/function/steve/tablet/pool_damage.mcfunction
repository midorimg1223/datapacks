#By ZCode —— 平板的血池记账（@s = 被打中的角色：亡灵矿工 / steve）
# 调用前先把数值写进 @s 的 tablet.dmg（轻击 10 / 重击 15）
# 计分板只存整数，所以这里只处理整数；要带小数就在调用前把 tablet.dmg 写成小数（会被截断）

# 亡灵矿工血池（mortal:steve/tablet/pool_hit 会先把没初始化的池子补成 250，再扣 dmg）
execute if entity @s[tag=undead_miner] run scoreboard players operation @s undead_miner.dmg = @s tablet.dmg
execute if entity @s[tag=undead_miner] run function mortal:steve/tablet/pool_hit

# steve 血池（函数在 role_hall 的 steve 包里）
execute if entity @s[tag=steve] run scoreboard players operation @s steve.dmg = @s tablet.dmg
execute if entity @s[tag=steve] run function mortal:steve/pool_hit

# 给攻击者打一笔击杀标记：角色是"血池归零"倒下（原版从没死过，player_killed_entity 不会触发），
# 所以在这里替它打上 death.killflag，死亡提示/击杀广播才能显示出"谁杀了谁"
execute as @e[tag=tablet_me] run scoreboard players set @s death.killflag 1
execute as @e[tag=tablet_me] run scoreboard players set @s death.killttl 20
