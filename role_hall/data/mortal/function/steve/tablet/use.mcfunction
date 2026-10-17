#By ZCode —— 右键分派（@s = 玩家）：手里是平板才继续
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/heavy_attack
