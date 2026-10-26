#By ZCode —— 给 steve 挂判定盒（@s = 玩家；不再骑乘，靠 hb.key + 每 tick tp 跟随）
summon minecraft:interaction ~ ~ ~ {Tags:["melee_hitbox","hb_steve"],width:0.9f,height:2.1f,response:0b,NoGravity:1b}
tag @s add hb_has_box
execute store result score @e[type=minecraft:interaction,tag=hb_steve,distance=..0.5,sort=nearest,limit=1] hb.key run scoreboard players get @s steve.slot
scoreboard players set @e[type=minecraft:interaction,tag=hb_steve,distance=..0.5,sort=nearest,limit=1] hb.at_last -1
scoreboard players set @e[type=minecraft:interaction,tag=hb_steve,distance=..0.5,sort=nearest,limit=1] hb.it_last -1
