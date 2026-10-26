#By ZCode —— 把盒子 tp 到槽位 $(n) 的亡灵矿工（宏函数；没主人就什么也不做，不报错）
$execute if entity @a[tag=undead_miner,scores={undead_miner.slot=$(n)}] run tp @s @a[tag=undead_miner,scores={undead_miner.slot=$(n)}]
