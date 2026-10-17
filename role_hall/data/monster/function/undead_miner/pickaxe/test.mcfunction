#By ZCode —— 亡灵之镐 自检：进游戏、手持亡灵之镐，执行 /function monster:undead_miner/pickaxe/test
# 把 ①~⑤ 的结果发出来，就能定位卡在哪一环
tellraw @s [{"text":"===== 亡灵之镐 自检 =====","color":"gold"}]

tellraw @s [{"text":"① tick 心跳：","color":"gray"},{"score":{"name":"@s","objective":"undead_pickaxe.beat"}},{"text":"  （多点两次看它涨不涨；不涨 = tick 没跑，重击一定是死的）","color":"dark_gray"}]
tellraw @s [{"text":"② 累计检测到的右键：","color":"gray"},{"score":{"name":"@s","objective":"undead_pickaxe.rc_total"}},{"text":"  （右键一下 +1；不动 = 右键统计没生效）","color":"dark_gray"}]

execute if items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run tellraw @s [{"text":"③ 手持：","color":"gray"},{"text":"是亡灵之镐 OK","color":"green"}]
execute unless items entity @s weapon.mainhand *[custom_data~{Tags:["undead_pickaxe"]}] run tellraw @s [{"text":"③ 手持：","color":"gray"},{"text":"不是亡灵之镐，换到主手","color":"red"}]

tellraw @s [{"text":"④ 轻击冷却：","color":"gray"},{"score":{"name":"@s","objective":"undead_pickaxe.cd_light"}},{"text":"   重击冷却：","color":"gray"},{"score":{"name":"@s","objective":"undead_pickaxe.cd_heavy"}},{"text":"  （一直停在同一个正数 = tick 没在递减）","color":"dark_gray"}]

execute anchored eyes positioned ^ ^ ^2 if entity @e[distance=..2.6,tag=!undead_pickaxe_me,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker] run tellraw @s [{"text":"⑤ 身前 2.6 格：","color":"gray"},{"text":"有可打的生物 OK","color":"green"}]
execute anchored eyes positioned ^ ^ ^2 unless entity @e[distance=..2.6,tag=!undead_pickaxe_me,type=!minecraft:item,type=!minecraft:experience_orb,type=!minecraft:armor_stand,type=!minecraft:interaction,type=!minecraft:marker] run tellraw @s [{"text":"⑤ 身前 2.6 格：","color":"gray"},{"text":"没有目标（站近点、正对着它）","color":"red"}]

tellraw @s [{"text":"对照：③ 拿错手 / ⑤ 没目标 → 攻击不会有反应；轻击靠原版左键打中实体触发，重击靠右键。","color":"yellow"}]
