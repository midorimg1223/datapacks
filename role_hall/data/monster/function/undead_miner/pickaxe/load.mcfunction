#By ZCode —— 亡灵之镐 初始化
# 右键检测：诡异菌钓竿的 used 统计（和亡魂灯的 soul_lantern.rc 各记各的，互不冲突）
scoreboard objectives add undead_pickaxe.rc minecraft.used:minecraft.warped_fungus_on_a_stick
# 冷却：轻击 12 tick（0.6 秒）/ 重击 40 tick（2 秒）
scoreboard objectives add undead_pickaxe.cd_light dummy
scoreboard objectives add undead_pickaxe.cd_heavy dummy
# 自检用（游戏里执行 /function monster:undead_miner/pickaxe/test 会读它们）
scoreboard objectives add undead_pickaxe.beat dummy
scoreboard objectives add undead_pickaxe.rc_total dummy
