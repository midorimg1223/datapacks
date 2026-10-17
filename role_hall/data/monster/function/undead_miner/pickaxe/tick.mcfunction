#By ZCode —— 亡灵之镐 主循环

# 自检心跳（/function monster:undead_miner/pickaxe/test 会读它）
scoreboard players add @a undead_pickaxe.beat 1

# 冷却递减（20 tick = 1 秒）
scoreboard players remove @a[scores={undead_pickaxe.cd_light=1..}] undead_pickaxe.cd_light 1
scoreboard players remove @a[scores={undead_pickaxe.cd_heavy=1..}] undead_pickaxe.cd_heavy 1
# 把分数建出来：没初始化的分数在 matches ..0 判断里会直接失败，会静默吃掉攻击
scoreboard players add @a undead_pickaxe.cd_light 0
scoreboard players add @a undead_pickaxe.cd_heavy 0

# ★ 右键分派放最前面：后面任何一条命令出问题都不会再挡住重击
#   at @s 不能少 —— tick 的执行位置是世界原点，只写 as 会让「眼睛前方」从原点算起
execute as @a[scores={undead_pickaxe.rc=1..}] run scoreboard players add @s undead_pickaxe.rc_total 1
execute as @a[scores={undead_pickaxe.rc=1..}] at @s run function monster:undead_miner/pickaxe/use
scoreboard players reset @a[scores={undead_pickaxe.rc=1..}] undead_pickaxe.rc

# 丢不掉：掉出去立刻收回
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["undead_pickaxe"]}}}}] at @s if entity @p[tag=!spectator,distance=..8] run function monster:undead_miner/pickaxe/retrieve

# 关掉原版攻速：保证每次左键都是满蓄力（原版本身 1 点 + 轻击函数补的 3 点 = 轻击 4 点）
execute as @a run attribute @s attack_speed base set 1024
execute as @a[tag=!spectator] run attribute @s attack_damage base set 1
# 旁观者不能攻击
execute as @a[tag=spectator] run attribute @s attack_damage base set 0
