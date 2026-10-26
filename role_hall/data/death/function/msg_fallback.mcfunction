#By ZCode —— 没有武器记录时：先看原版击杀标记（killflag），再退回环境
execute if entity @a[tag=!spectator,scores={death.killflag=1}] run title @a[tag=death_victim] subtitle [{"text":"被 ","color":"red"},{"selector":"@a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1]","color":"white","bold":true},{"text":" 击杀","color":"red"}]
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s times 5 40 10
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s title [{"text":"击杀！","color":"dark_red","bold":true}]
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run title @s subtitle [{"selector":"@a[tag=death_victim]","color":"white","bold":true},{"text":" 被击杀","color":"gray"}]
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] run tellraw @a [{"selector":"@s","color":"red"},{"text":" 击杀了 ","color":"gray"},{"selector":"@a[tag=death_victim]","color":"white"}]
execute as @a[tag=!spectator,scores={death.killflag=1},sort=nearest,limit=1] at @s run playsound mcdd:streak1 master @s ~ ~ ~ 1 1
execute unless entity @a[tag=!spectator,scores={death.killflag=1}] run title @a[tag=death_victim] subtitle [{"text":"被环境或生物击杀","color":"gray"}]
