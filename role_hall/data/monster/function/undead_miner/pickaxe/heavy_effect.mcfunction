#By ZCode —— 重击：20 伤害 / 40 tick（2 秒）· 单目标 + 视线检查
execute anchored eyes positioned ^ ^ ^0.9 unless block ~ ~ ~ #minecraft:replaceable run return 0
execute anchored eyes positioned ^ ^ ^1.8 unless block ~ ~ ~ #minecraft:replaceable run return 0
scoreboard players set @s undead_pickaxe.cd_heavy 40
execute as @s run tag @s add undead_pickaxe_me
execute anchored eyes positioned ^ ^ ^2.0 as @e[distance=..2.6,sort=nearest,limit=1,tag=!undead_pickaxe_me,tag=!spectator,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] run function monster:undead_miner/pickaxe/heavy_hit_target
execute as @s run tag @s remove undead_pickaxe_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 1 0.8
