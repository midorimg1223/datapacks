#By ZCode —— 右键分派（@s = 玩家）：手里是亡灵之镐才继续
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run function monster:undead_miner/pickaxe/heavy_attack
