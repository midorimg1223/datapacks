#By ZCode —— 自愈：清掉所有判定盒，下一 tick 由 tick_dim 重新挂
kill @e[type=minecraft:interaction,tag=melee_hitbox]
scoreboard players set #hb.reset hb.timer 0
