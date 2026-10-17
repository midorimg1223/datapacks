#By ZCode —— 右键分派（@s = 攻击者，执行位置 = 攻击者）
# 和各自 tick 里 "used 统计" 那条路完全一致，按手持道具分发，so 指着敌人右键和右键空处行为一样
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run function monster:undead_miner/pickaxe/use
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/use
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["soul_lantern"]}] at @s align xyz run function monster:undead_miner/lantern/place
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["soul_lantern_tp"]}] run function monster:undead_miner/lantern/tp
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run function mortal:steve/adrenaline_use
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_horse_soul"]}] run function monster:undead_miner/pickaxe/charm_use
