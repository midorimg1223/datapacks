#By ZCode —— 左键分派（@s = 攻击者，执行位置 = 攻击者）
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run function monster:undead_miner/pickaxe/light_attack
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/light_attack
