#By ZCode —— 单维度：维护判定盒 + 检测左右键（执行位置 = 该维度原点）

# 0) 时间闸：只处理"最近 5 tick 内"的记录，避免处理存档里带过来的旧记录
execute store result score #hb.time hb.timer run time query gametime
scoreboard players remove #hb.time hb.timer 5

# 1) 谁手里拿着武器（决定"附近的生物要不要挂盒子"）
tag @a remove hb_armed
execute as @a if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run tag @s add hb_armed
execute as @a if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run tag @s add hb_armed

# 2) 角色玩家：没有"已挂盒子"标记就挂一个（幂等；不再用 ride —— 原版禁止把玩家当坐骑）
execute as @a[tag=undead_miner,tag=!spectator] unless entity @s[tag=hb_has_box] run function hitbox:attach_miner
execute as @a[tag=steve,tag=!spectator] unless entity @s[tag=hb_has_box] run function hitbox:attach_steve

# 2b) 每 tick 把盒子 tp 到主人（hb.key = 角色槽位号 1~6）
execute as @e[tag=hb_miner] store result storage hitbox:key n int 1 run scoreboard players get @s hb.key
execute as @e[tag=hb_miner] run function hitbox:follow_miner with storage hitbox:key
execute as @e[tag=hb_steve] store result storage hitbox:key n int 1 run scoreboard players get @s hb.key
execute as @e[tag=hb_steve] run function hitbox:follow_steve with storage hitbox:key

# 2c) 已经不该有盒子的玩家：清标记 + 清掉身边的角色盒子（卸角色/死亡/旁观）
execute as @a[tag=!undead_miner,tag=!steve] run tag @s remove hb_has_box
execute as @a[tag=spectator] run tag @s remove hb_has_box
execute as @a[tag=!undead_miner] at @s run kill @e[tag=hb_miner,distance=..1]
execute as @a[tag=!steve] at @s run kill @e[tag=hb_steve,distance=..1]
execute as @a[tag=spectator] at @s run kill @e[type=minecraft:interaction,tag=melee_hitbox,distance=..1]

# 3) 其他敌对生物：8 格内有持械者、且身上没盒子才挂（生物可以骑，ride 对生物有效）
execute as @e[type=!minecraft:player,tag=!undead_miner,tag=!steve,tag=!spectator,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] unless data entity @s Passengers[{id:"minecraft:interaction"}] unless entity @e[type=minecraft:interaction,tag=hb_other,distance=..2] if entity @a[tag=hb_armed,distance=..8] run function hitbox:attach_other

# 4) 自愈：每 600 tick（30 秒）清掉所有盒子重建（处理各种残留）
scoreboard players add #hb.reset hb.timer 1
execute if score #hb.reset hb.timer matches 600.. run function hitbox:reset

# 5) 左键：盒子上的 attack 记录变了 → 交给对应武器的轻击入口
execute as @e[type=minecraft:interaction,tag=melee_hitbox] store result score @s hb.at_now run data get entity @s attack.timestamp
execute as @e[type=minecraft:interaction,tag=melee_hitbox] if score @s hb.at_now > #hb.time hb.timer unless score @s hb.at_now = @s hb.at_last run function hitbox:attack

# 6) 右键：盒子上的 interaction 记录变了 → 按手持道具分派
execute as @e[type=minecraft:interaction,tag=melee_hitbox] store result score @s hb.it_now run data get entity @s interaction.timestamp
execute as @e[type=minecraft:interaction,tag=melee_hitbox] if score @s hb.it_now > #hb.time hb.timer unless score @s hb.it_now = @s hb.it_last run function hitbox:rightclick
