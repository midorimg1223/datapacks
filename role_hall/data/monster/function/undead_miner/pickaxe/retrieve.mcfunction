#By ZCode —— 掉地上的镐子收回给它的主人（最近的亡灵矿工）；没有矿工才给最近的玩家
execute as @p[tag=undead_miner,tag=!spectator,distance=..8] run function monster:undead_miner/pickaxe/give
execute unless entity @p[tag=undead_miner,tag=!spectator,distance=..8] as @p[tag=!spectator,distance=..8] run function monster:undead_miner/pickaxe/give
kill @s
