#By ZCode —— 轻击效果：10 伤害 / 冷却 12 tick（0.6 秒）
# 原版左键本身有 1 点（tick 里把 attack_damage 定成 1），所以这里给其他目标补 9 点 = 一共 10 点
# 角色目标（亡灵矿工 / steve）走血池，各扣 10 点
scoreboard players set @s undead_pickaxe.cd_light 12
execute as @s run tag @s add undead_pickaxe_me

# 亡灵矿工 -> 扣它血池（10 是整数，直接写）
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=undead_miner,tag=!undead_pickaxe_me] run scoreboard players set @s undead_miner.dmg 10
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=undead_miner,tag=!undead_pickaxe_me] run function monster:undead_miner/pickaxe/pool_hit

# steve -> 扣它血池
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=steve,tag=!undead_pickaxe_me] run scoreboard players set @s steve.dmg 10
execute anchored eyes positioned ^ ^ ^1.5 as @e[distance=..2.2,sort=nearest,limit=1,tag=steve,tag=!undead_pickaxe_me] run function mortal:steve/pool_hit

# 其他目标 -> 补 9 点原版伤害
execute anchored eyes positioned ^ ^ ^1.5 run damage @e[distance=..2.2,sort=nearest,limit=1,tag=!undead_pickaxe_me,tag=!undead_miner,tag=!steve,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] 9 minecraft:generic by @s

# 给攻击者打一笔击杀标记：角色是"血池归零"倒下（原版从没死过，player_killed_entity 不会触发），
# 所以在这里替它打上 death.killflag，死亡提示/击杀广播才能显示出"谁杀了谁"
execute as @e[tag=undead_pickaxe_me] run scoreboard players set @s death.killflag 1
execute as @e[tag=undead_pickaxe_me] run scoreboard players set @s death.killttl 20

execute as @s run tag @s remove undead_pickaxe_me
execute at @s positioned ~ ~1 ~ positioned ^ ^ ^1 run particle minecraft:sweep_attack ~ ~ ~ 0 0 0 0 1 force
execute at @s run playsound minecraft:item.trident.throw player @a[distance=..10] ~ ~ ~ 0.7 1.6
