#By ZCode —— 重击的血池记账（@s = 被打中的角色：亡灵矿工 / steve）
# 20 是整数，直接记账；角色带满级抗性，原版血不掉，实际伤害只走血池
# （以前 8.5 需要"整数 + 半点累计"，现在换成整数就不用了）

# 亡灵矿工血池（pool_hit 会先把没初始化的池子补成 250，再扣 dmg）
execute if entity @s[tag=undead_miner] run scoreboard players set @s undead_miner.dmg 20
execute if entity @s[tag=undead_miner] run function monster:undead_miner/pickaxe/pool_hit

# steve 血池（函数在 role_hall 包里）
execute if entity @s[tag=steve] run scoreboard players set @s steve.dmg 20
execute if entity @s[tag=steve] run function mortal:steve/pool_hit

# 给攻击者打一笔击杀标记：角色是"血池归零"倒下（原版从没死过，player_killed_entity 不会触发），
# 所以在这里替它打上 death.killflag，死亡提示/击杀广播才能显示出"谁杀了谁"
execute as @e[tag=undead_pickaxe_me] run scoreboard players set @s death.killflag 1
execute as @e[tag=undead_pickaxe_me] run scoreboard players set @s death.killttl 20
