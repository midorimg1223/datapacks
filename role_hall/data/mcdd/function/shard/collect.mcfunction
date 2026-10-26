# 由碎晶实体执行（@s = 碎晶）：cm_mortal 玩家靠近即收集，随机播放一段碎片音效
playsound mcdd:shard_pickup master @a ~ ~ ~ 1 1
particle minecraft:dragon_breath ~ ~ ~ 0.3 0.4 0.3 0.05 30
particle minecraft:end_rod ~ ~ ~ 0.2 0.3 0.2 0.02 12

# 最近的收集者充能 +2（上限 100，接入现有 Steve 充能条）
execute as @a[tag=cm_mortal,distance=..2,sort=nearest,limit=1] run scoreboard players add @s steve.charge 2
execute as @a[tag=cm_mortal,distance=..2,sort=nearest,limit=1,scores={steve.charge=101..}] run scoreboard players set @s steve.charge 100

kill @s
