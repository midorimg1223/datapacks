#By ZCode —— 单盏灯的处理（@s = 灯的锚点 marker）
# 作用半径 7 格：见下面所有 distance=..7
# 寿命 1 分 30 秒 = 1800 tick、最后 10 秒预警：见下面 matches 1800.. / 1600..

# 寿命倒计时；到点拆灯
scoreboard players add @s soul_lantern.age 1
execute if score @s soul_lantern.age matches 1800.. run function monster:undead_miner/lantern/expire

# —— 最后 10 秒（age 1600~1799）预警 ——
# 只喊一次，且只喊给亡灵矿工
execute if score @s soul_lantern.age matches 1600 run tellraw @a[tag=undead_miner] [{"text":"[亡魂灯] ","color":"light_purple"},{"text":"一盏亡魂灯即将熄灭","color":"gold"}]
# 每 40 tick（2 秒）一次：灵魂火焰粒子 + 熄灭音
# particle 参数顺序是 <dx dy dz> <speed> <count> <mode>，count 必须是整数
execute if score @s soul_lantern.age matches 1600..1799 run scoreboard players add @s soul_lantern.warn 1
execute if score @s soul_lantern.warn matches 41.. run scoreboard players set @s soul_lantern.warn 1
execute if score @s soul_lantern.age matches 1600..1799 if score @s soul_lantern.warn matches 1 run particle minecraft:soul_fire_flame ~0.5 ~0.6 ~0.5 0.25 0.25 0.25 0.01 12 force
execute if score @s soul_lantern.age matches 1600..1799 if score @s soul_lantern.warn matches 1 run playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 0.7 1.4

# 范围内是否有凡人
execute store result score @s soul_lantern.flag if entity @a[tag=mortal,distance=..7]

# 只在「凡人刚进入」的那一瞬报警一次：用 active 标记做边沿判断
execute if score @s soul_lantern.flag matches 1.. unless entity @s[tag=soul_lantern_active] run function monster:undead_miner/lantern/alert

# 幂等地维护 active 标记
execute if score @s soul_lantern.flag matches 1.. unless entity @s[tag=soul_lantern_active] run tag @s add soul_lantern_active
execute if score @s soul_lantern.flag matches 0 if entity @s[tag=soul_lantern_active] run tag @s remove soul_lantern_active

# 暴露期间持续保证亡灵矿工手里有回魂令（幂等）
execute if score @s soul_lantern.flag matches 1.. as @a[tag=undead_miner] unless items entity @s container.* *[custom_data~{Tags:["soul_lantern_tp"]}] run function monster:undead_miner/lantern/give_tp

# 凡人：失明 + 缓慢 + 发光
execute as @a[tag=mortal,distance=..7] run function monster:undead_miner/lantern/debuff
