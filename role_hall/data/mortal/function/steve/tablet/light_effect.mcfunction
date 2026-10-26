#By ZCode —— 平板轻击：10 伤害 / 10 tick（0.5 秒）· 单目标 + 视线检查
execute anchored eyes positioned ^ ^ ^1.0 unless block ~ ~ ~ #minecraft:replaceable run return 0
scoreboard players set @s tablet.cd_light 10
execute as @s run tag @s add tablet_me
execute anchored eyes positioned ^ ^ ^1.0 as @e[distance=..2.0,sort=nearest,limit=1,tag=!tablet_me,tag=!spectator,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] run function mortal:steve/tablet/light_hit_target
execute as @s run tag @s remove tablet_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 0.7 1.4
