#By ZCode —— 给亡灵矿工挂判定盒（@s = 目标：玩家或生物）
# 尺寸比玩家本体稍大一圈（0.6×1.8 → 0.9×2.1）：这样攻击射线永远先碰到盒子，而不是先碰到本体
summon minecraft:interaction ~ ~ ~ {Tags:["melee_hitbox","hb_miner","hb_new"],width:0.9f,height:2.1f,response:0b,NoGravity:1b}
ride @e[type=minecraft:interaction,tag=hb_new,limit=1] mount @s
scoreboard players set @e[type=minecraft:interaction,tag=hb_new,limit=1] hb.at_last -1
scoreboard players set @e[type=minecraft:interaction,tag=hb_new,limit=1] hb.it_last -1
tag @e[type=minecraft:interaction,tag=hb_new] remove hb_new
