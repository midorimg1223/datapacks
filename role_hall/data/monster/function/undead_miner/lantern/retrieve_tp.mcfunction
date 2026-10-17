#By ZCode —— 丢不掉的回魂令：先还给最近的玩家，再清掉地上那把
execute as @p[distance=..8] run function monster:undead_miner/lantern/give_tp
kill @s
