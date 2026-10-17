#By ZCode —— 丢不掉的亡魂灯：先还给最近的玩家（背包满就掉脚下，下一 tick 再收回），再清掉地上那把
execute as @p[distance=..8] run function monster:undead_miner/lantern/give
kill @s
