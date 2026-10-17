#By ZCode —— 单维度：维护判定盒 + 检测左右键（执行位置 = 该维度原点）

# 0) 时间闸：只处理"最近 5 tick 内"的记录，避免处理存档里带过来的旧记录
execute store result score #hb.time hb.timer run time query gametime
scoreboard players remove #hb.time hb.timer 5

# 1) 谁手里拿着武器（决定"附近的生物要不要挂盒子"）
tag @a remove hb_armed
execute as @a if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run tag @s add hb_armed
execute as @a if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run tag @s add hb_armed

# 2) 角色（玩家或生物都行）：身上没骑盒子就挂一个（幂等）
execute as @e[tag=undead_miner,tag=!spectator] unless data entity @s Passengers[{id:"minecraft:interaction"}] run function hitbox:attach_miner
execute as @e[tag=steve,tag=!spectator] unless data entity @s Passengers[{id:"minecraft:interaction"}] run function hitbox:attach_steve

# 3) 其他敌对生物：8 格内有持械者、且自己身上没盒子才挂（不想管生物就把这行删掉）
execute as @e[type=!minecraft:player,tag=!undead_miner,tag=!steve,tag=!spectator,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker,type=!minecraft:item_frame,type=!minecraft:glow_item_frame,type=!minecraft:painting,type=!minecraft:area_effect_cloud,type=!minecraft:leash_knot,type=!minecraft:arrow,type=!minecraft:spectral_arrow,type=!minecraft:firework_rocket,type=!minecraft:falling_block,type=!minecraft:eye_of_ender] unless data entity @s Passengers[{id:"minecraft:interaction"}] if entity @a[tag=hb_armed,distance=..8] run function hitbox:attach_other

# 4) 自愈：每 600 tick（30 秒）把所有盒子清掉，让 2) 3) 重新挂
#    （主人死亡/掉线时盒子会随主人一起消失，所以这里只是安全网；间隔太短会白白丢记录）
scoreboard players add #hb.reset hb.timer 1
execute if score #hb.reset hb.timer matches 600.. run function hitbox:reset

# 5) 左键：盒子上的 attack 记录变了 → 交给对应武器的轻击入口
execute as @e[type=minecraft:interaction,tag=melee_hitbox] store result score @s hb.at_now run data get entity @s attack.timestamp
execute as @e[type=minecraft:interaction,tag=melee_hitbox] if score @s hb.at_now > #hb.time hb.timer unless score @s hb.at_now = @s hb.at_last run function hitbox:attack

# 6) 右键：盒子上的 interaction 记录变了 → 按手持道具分派
execute as @e[type=minecraft:interaction,tag=melee_hitbox] store result score @s hb.it_now run data get entity @s interaction.timestamp
execute as @e[type=minecraft:interaction,tag=melee_hitbox] if score @s hb.it_now > #hb.time hb.timer unless score @s hb.it_now = @s hb.it_last run function hitbox:rightclick
