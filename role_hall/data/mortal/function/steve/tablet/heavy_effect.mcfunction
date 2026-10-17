#By ZCode —— 平板 · 重击：15 伤害 / 冷却 30 tick（1.5 秒）
# 目标是「亡灵矿工」或「steve」时扣各自的血池；其他目标走原版伤害
# 改数值：下面 damage 的 15 + 两个 15（血池记账）
scoreboard players set @s tablet.cd_heavy 30
execute as @s run tag @s add tablet_me

# 亡灵矿工 -> 扣它血池
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=undead_miner,tag=!tablet_me] run scoreboard players set @s tablet.dmg 15
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=undead_miner,tag=!tablet_me] run function mortal:steve/tablet/pool_damage

# steve -> 扣它血池
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=steve,tag=!tablet_me] run scoreboard players set @s tablet.dmg 15
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=steve,tag=!tablet_me] run function mortal:steve/tablet/pool_damage

# 其他目标 -> 原版伤害（重击不是原版左键，所以这里是 15 全额）
execute anchored eyes positioned ^ ^ ^2 run damage @e[distance=..2.6,sort=nearest,limit=1,tag=!tablet_me,tag=!undead_miner,tag=!steve,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] 15 minecraft:generic by @s

execute as @s run tag @s remove tablet_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 1 0.8
