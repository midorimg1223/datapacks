#By ZCode —— 判定盒 自检：进游戏、站在敌人面前执行 /function hitbox:test
tellraw @s [{"text":"===== 近战判定盒 自检 =====","color":"gold"}]

execute if entity @e[type=minecraft:interaction,tag=melee_hitbox] run tellraw @s [{"text":"① 本维度有判定盒 OK","color":"green"}]
execute unless entity @e[type=minecraft:interaction,tag=melee_hitbox] run tellraw @s [{"text":"① 本维度一个判定盒都没有 —— 需要有人在带 undead_miner / steve 标签，或者你拿着武器靠近生物","color":"red"}]

execute anchored eyes positioned ^ ^ ^2 if entity @e[type=minecraft:interaction,tag=melee_hitbox,distance=..2.6] run tellraw @s [{"text":"② 身前 2.6 格内有判定盒 OK：左键/右键都会先被它接住（不再吃无敌帧）","color":"green"}]
execute anchored eyes positioned ^ ^ ^2 unless entity @e[type=minecraft:interaction,tag=melee_hitbox,distance=..2.6] run tellraw @s [{"text":"② 身前没有判定盒 —— 你对着的这个目标没被挂上盒子","color":"red"}]

tellraw @s [{"text":"③ 点一下（左键或右键），再执行一次本命令，看下面两个数字有没有变成刚才的游戏刻：","color":"gray"}]
execute as @e[type=minecraft:interaction,tag=melee_hitbox,sort=nearest,limit=1] run tellraw @s [{"text":"   最近盒子的 左键时间戳 / 右键时间戳：","color":"dark_gray"},{"score":{"name":"@e[type=minecraft:interaction,tag=melee_hitbox,sort=nearest,limit=1]","objective":"hb.at_last"}},{"text":" / ","color":"dark_gray"},{"score":{"name":"@e[type=minecraft:interaction,tag=melee_hitbox,sort=nearest,limit=1]","objective":"hb.it_last"}},{"text":"   （-1 = 还没被打过）","color":"dark_gray"}]
