#By ZCode —— 自愈：清掉所有判定盒与"已挂盒子"标记，下一 tick 重新挂
kill @e[type=minecraft:interaction,tag=melee_hitbox]
tag @a remove hb_has_box
scoreboard players set #hb.reset hb.timer 0
