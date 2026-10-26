#By ZCode —— 重击命中结算（@s = 唯一目标）
execute if entity @s[tag=undead_miner] run scoreboard players set @s undead_miner.dmg 20
execute if entity @s[tag=undead_miner] run function monster:undead_miner/pickaxe/pool_hit
execute if entity @s[tag=steve] run scoreboard players set @s steve.dmg 20
execute if entity @s[tag=steve] run function mortal:steve/pool_hit
execute unless entity @s[tag=undead_miner] unless entity @s[tag=steve] run damage @s 20 minecraft:generic by @e[tag=undead_pickaxe_me,limit=1]
execute if entity @e[tag=undead_pickaxe_me] run scoreboard players set @s death.attacker_kind 1
execute if entity @e[tag=undead_pickaxe_me] run scoreboard players set @s death.attacker_ttl 40
execute if entity @e[tag=undead_pickaxe_me] store result score @s death.attacker_slot run scoreboard players get @e[tag=undead_pickaxe_me,limit=1] undead_miner.slot
# 受击反馈：靠 0.01 触发红闪（角色原版血不掉）
damage @s 0.01 minecraft:generic by @e[tag=undead_pickaxe_me,limit=1]
