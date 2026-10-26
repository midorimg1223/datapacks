#By ZCode —— 左键分派（@s = 攻击者）：打盒子时补上原版缺失的那 1 点
execute if entity @s[tag=spectator] run return 0
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run tag @s add hb_box_hit
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run function monster:undead_miner/pickaxe/light_attack
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run tag @s add hb_box_hit
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/light_attack
tag @s remove hb_box_hit
