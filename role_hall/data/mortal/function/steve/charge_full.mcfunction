#By ZCode —— 测试用：把充能值直接拉满（下一 tick 自动释放加速）
scoreboard players set @s steve.charge 100
tellraw @s [{"text":"[充能] ","color":"yellow"},{"text":"已设为 100，下一 tick 自动释放加速","color":"gray"}]
