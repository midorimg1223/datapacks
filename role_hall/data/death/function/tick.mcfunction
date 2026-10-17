#By ZCode —— 死亡 / 幽灵 / 重生 主循环

# 1) 检测"真正的死亡"：deathCount 每死一次 +1（角色玩家一般是血池归零走 down，不走这里）
execute as @a[scores={deaths=1..},tag=!spectator] at @s run function death:on_death
scoreboard players reset @a[scores={deaths=1..}] deaths

# 2) 击杀标记 1 秒后过期：只有"最近 1 秒内出过手"的人才会被当成击杀者
scoreboard players remove @a[scores={death.killttl=1..}] death.killttl 1
execute as @a[scores={death.killttl=..0}] run scoreboard players reset @s death.killflag
execute as @a[scores={death.killttl=..0}] run scoreboard players reset @s death.killttl

# 3) 幽灵倒计时：600 tick = 30 秒，到点复活
scoreboard players remove @a[tag=spectator,scores={death.timer=1..}] death.timer 1
execute as @a[tag=spectator,scores={death.timer=..0}] run function death:respawn

# 4) 幽灵期间（这 30 秒）在物品栏上方显示剩余秒数
scoreboard players set #twenty death.sec 20
execute as @a[tag=spectator,scores={death.timer=0..}] run scoreboard players operation #sec death.sec = @s death.timer
execute as @a[tag=spectator,scores={death.timer=0..}] run scoreboard players operation #sec death.sec /= #twenty death.sec
execute as @a[tag=spectator,scores={death.timer=0..}] run title @s actionbar [{"text":"你距离复活还有 ","color":"gray"},{"score":{"name":"#sec","objective":"death.sec"}},{"text":" 秒","color":"gray"}]

# 5) 重生前 3 / 2 / 1 秒：三声沉重的钟声（音调依次略升：60/40/20 tick 各匹配一次）
execute as @a[tag=spectator,scores={death.timer=60}] at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.6
execute as @a[tag=spectator,scores={death.timer=40}] at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.7
execute as @a[tag=spectator,scores={death.timer=20}] at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.85

# 6) 幽灵期间保持隐身：若玩家是"真死"（走原版死亡界面再重生），重生会清掉所有药水效果，
#    这里每 tick 补一次，保证幽灵始终看不见
execute as @a[tag=spectator] run effect give @s minecraft:invisibility infinite 0 true
