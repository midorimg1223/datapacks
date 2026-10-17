#By ZCode —— 给没有槽位的亡灵矿工分配一个空闲 bossbar 槽位（1~6）
scoreboard players set @s undead_miner.slot 0
execute unless entity @a[scores={undead_miner.slot=1}] run scoreboard players set @s undead_miner.slot 1
execute if score @s undead_miner.slot matches 0 unless entity @a[scores={undead_miner.slot=2}] run scoreboard players set @s undead_miner.slot 2
execute if score @s undead_miner.slot matches 0 unless entity @a[scores={undead_miner.slot=3}] run scoreboard players set @s undead_miner.slot 3
execute if score @s undead_miner.slot matches 0 unless entity @a[scores={undead_miner.slot=4}] run scoreboard players set @s undead_miner.slot 4
execute if score @s undead_miner.slot matches 0 unless entity @a[scores={undead_miner.slot=5}] run scoreboard players set @s undead_miner.slot 5
execute if score @s undead_miner.slot matches 0 unless entity @a[scores={undead_miner.slot=6}] run scoreboard players set @s undead_miner.slot 6
execute if score @s undead_miner.slot matches 0 run tellraw @s [{"text":"[亡灵矿工] 槽位已满（最多 6 人显示生命条）","color":"red"}]
