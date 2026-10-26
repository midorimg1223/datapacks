#By ZCode —— 把盒子 tp 到槽位 $(n) 的 steve（宏函数；没主人就什么也不做，不报错）
$execute if entity @a[tag=steve,scores={steve.slot=$(n)}] run tp @s @a[tag=steve,scores={steve.slot=$(n)}]
