#By ZCode —— 使用提示（只有亡灵矿工能看，凡人执行不会有任何输出）
tellraw @a[tag=undead_miner] [{"text":"===== 亡魂灯 =====","color":"aqua"}]
tellraw @a[tag=undead_miner] [{"text":"/function monster:undead_miner/lantern/give","color":"yellow"},{"text":" → 拿亡魂灯，右键在原地放一盏（90 秒后自动消失）","color":"gray"}]
tellraw @a[tag=undead_miner] [{"text":"/trigger soul_lantern.tp","color":"yellow"},{"text":" → 传送到正在暴露凡人的亡魂灯","color":"gray"}]
tellraw @a[tag=undead_miner] [{"text":"回魂令会在探测到凡人时自动补发；这期间传送到灯处会拆掉那盏灯。","color":"dark_gray"}]
