#By ZCode —— 把执行者标记为「亡灵矿工」，并确保他手上有一枚回魂令
tag @s add undead_miner
tag @s remove mortal
execute unless items entity @s container.* *[custom_data~{Tags:["soul_lantern_tp"]}] run function monster:undead_miner/lantern/give_tp
