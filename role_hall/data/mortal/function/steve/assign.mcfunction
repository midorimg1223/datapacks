#By ZCode —— 给没有槽位的 steve 分配一个空闲 bossbar 槽位（1~6）
scoreboard players set @s steve.slot 0
execute unless entity @a[scores={steve.slot=1}] run scoreboard players set @s steve.slot 1
execute if score @s steve.slot matches 0 unless entity @a[scores={steve.slot=2}] run scoreboard players set @s steve.slot 2
execute if score @s steve.slot matches 0 unless entity @a[scores={steve.slot=3}] run scoreboard players set @s steve.slot 3
execute if score @s steve.slot matches 0 unless entity @a[scores={steve.slot=4}] run scoreboard players set @s steve.slot 4
execute if score @s steve.slot matches 0 unless entity @a[scores={steve.slot=5}] run scoreboard players set @s steve.slot 5
execute if score @s steve.slot matches 0 unless entity @a[scores={steve.slot=6}] run scoreboard players set @s steve.slot 6
execute if score @s steve.slot matches 0 run tellraw @s [{"text":"[steve] 槽位已满（最多 6 人显示生命条）","color":"red"}]
