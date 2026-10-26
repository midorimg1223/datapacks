#By ZCode —— 轻击命中结算（@s = 唯一目标，一次只结算一个）
# 血池角色：扣 10
execute if entity @s[tag=undead_miner] run scoreboard players set @s undead_miner.dmg 10
execute if entity @s[tag=undead_miner] run function monster:undead_miner/pickaxe/pool_hit
execute if entity @s[tag=steve] run scoreboard players set @s steve.dmg 10
execute if entity @s[tag=steve] run function mortal:steve/pool_hit
# 其他目标：原版 9 + 原版左键 1 = 10；盒子路径没有那 1 点，补齐
execute unless entity @s[tag=undead_miner] unless entity @s[tag=steve] run damage @s 9 minecraft:generic by @e[tag=undead_pickaxe_me,limit=1]
execute unless entity @s[tag=undead_miner] unless entity @s[tag=steve] if entity @e[tag=hb_box_hit] run damage @s 1 minecraft:generic by @e[tag=undead_pickaxe_me,limit=1]
# 击杀归属：记在受害者身上（kind=1 矿工 / slot / 有效期 40 tick）
execute if entity @e[tag=undead_pickaxe_me] run scoreboard players set @s death.attacker_kind 1
execute if entity @e[tag=undead_pickaxe_me] run scoreboard players set @s death.attacker_ttl 40
execute if entity @e[tag=undead_pickaxe_me] store result score @s death.attacker_slot run scoreboard players get @e[tag=undead_pickaxe_me,limit=1] undead_miner.slot
