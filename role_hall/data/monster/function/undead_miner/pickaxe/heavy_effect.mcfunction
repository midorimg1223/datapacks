#By ZCode —— 重击效果：20 伤害 / 冷却 40 tick（2 秒）
# 目标是「亡灵矿工」或「steve」时扣各自的血池（角色带满级抗性，原版血不掉）；
# 其他目标走原版伤害。改数值：下面 damage 的 20 + heavy_pool 里的 20
# 判定：眼睛沿视线往前 2 格处的 2.6 格球内最近的一个目标（大约够到身前 3.5 格）
scoreboard players set @s undead_pickaxe.cd_heavy 40
execute as @s run tag @s add undead_pickaxe_me

# 亡灵矿工 -> 扣它血池
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=undead_miner,tag=!undead_pickaxe_me] run function monster:undead_miner/pickaxe/heavy_pool

# steve -> 扣它血池
execute anchored eyes positioned ^ ^ ^2 as @e[distance=..2.6,sort=nearest,limit=1,tag=steve,tag=!undead_pickaxe_me] run function monster:undead_miner/pickaxe/heavy_pool

# 其他目标 -> 原版伤害（重击不是原版左键，所以这里是 8.5 全额）
execute anchored eyes positioned ^ ^ ^2 run damage @e[distance=..2.6,sort=nearest,limit=1,tag=!undead_pickaxe_me,tag=!undead_miner,tag=!steve,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] 20 minecraft:generic by @s

execute as @s run tag @s remove undead_pickaxe_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 1 0.8
