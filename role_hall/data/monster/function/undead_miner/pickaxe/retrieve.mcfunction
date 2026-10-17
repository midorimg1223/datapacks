#By ZCode
# 先还给最近的玩家（背包满时会掉在脚下，下一 tick 再被收回，不会丢失），再清掉地上那把
execute as @p[tag=!spectator,distance=..8] run function monster:undead_miner/pickaxe/give
kill @s
