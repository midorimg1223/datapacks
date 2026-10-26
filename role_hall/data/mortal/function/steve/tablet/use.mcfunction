#By ZCode —— 右键分派（@s = 玩家）：手里是平板才继续
# 旁观者不能攻击
execute if entity @s[tag=spectator] run return 0
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/heavy_attack
