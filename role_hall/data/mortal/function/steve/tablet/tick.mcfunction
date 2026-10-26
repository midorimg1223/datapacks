# 自愈：标记说发过、但身上确实没有平板 → 清标记，下一 tick 自动补发
execute as @a[tag=steve,tag=!spectator,scores={steve.issued=1..}] unless items entity @s container.* *[custom_data~{Tags:["tablet"]}] unless items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] unless items entity @s weapon.offhand *[custom_data~{Tags:["tablet"]}] run scoreboard players reset @s steve.issued
#By ZCode —— 平板 · 每 tick

# 1) 冷却递减（20 tick = 1 秒）
scoreboard players remove @a[scores={tablet.cd_light=1..}] tablet.cd_light 1
scoreboard players remove @a[scores={tablet.cd_heavy=1..}] tablet.cd_heavy 1
# 把分数建出来：没初始化的分数在 matches ..0 判断里会直接失败，会静默吃掉攻击
scoreboard players add @a tablet.cd_light 0
scoreboard players add @a tablet.cd_heavy 0

# 2) ★ 右键分派放最前面：后面任何一条命令出问题都不会再挡住重击
#    at @s 不能少 —— tick 的执行位置是世界原点，只写 as 会让「眼睛前方」从原点算起
execute as @a[scores={tablet.rc=1..}] at @s run function mortal:steve/tablet/use
execute as @a[scores={tablet.rc=1..}] if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run function mortal:steve/adrenaline_use
scoreboard players reset @a[scores={tablet.rc=1..}] tablet.rc

# 3) 关掉原版攻速：保证每次左键都是满蓄力（原版本身 1 点 + 轻击函数补的 2.5 点 = 轻击 3.5 点）
#    （亡灵之镐那个包也会设同样的值，幂等，不冲突）

# 4) 不再是 steve 就把平板收走
execute as @a[tag=!steve] run clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["tablet"]}]

# 5) 丢出去的平板清掉（tag=steve 会自动补发）
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{Tags:["tablet"]}}}}] run kill @s

# 6) tag 是 steve 的自动持有平板：只在"没发过"时发一次（避免每 tick 重发）
execute as @a[tag=steve,tag=!spectator] unless score @s steve.issued matches 1 run function mortal:steve/tablet/give
