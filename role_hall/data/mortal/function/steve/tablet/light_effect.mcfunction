#By ZCode —— 平板 · 轻击：10 伤害 / 冷却 10 tick（0.5 秒）
# 原版左键本身有 1 点（tick 里把 attack_damage 定成 1），所以这里给其他目标补 9 点 = 一共 10 点
# 角色目标（亡灵矿工 / steve）走血池：各扣 10
scoreboard players set @s tablet.cd_light 10
execute as @s run tag @s add tablet_me

# 亡灵矿工 -> 扣它血池
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=undead_miner,tag=!tablet_me] run scoreboard players set @s tablet.dmg 10
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=undead_miner,tag=!tablet_me] run function mortal:steve/tablet/pool_damage

# steve -> 扣它血池
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=steve,tag=!tablet_me] run scoreboard players set @s tablet.dmg 10
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=steve,tag=!tablet_me] run function mortal:steve/tablet/pool_damage

# 其他目标 -> 补 9 点原版伤害
execute anchored eyes positioned ^ ^ ^1.5 run damage @e[distance=..2.2,sort=nearest,limit=1,tag=!tablet_me,tag=!undead_miner,tag=!steve,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] 9 minecraft:generic by @s

execute as @s run tag @s remove tablet_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 0.7 1.4
