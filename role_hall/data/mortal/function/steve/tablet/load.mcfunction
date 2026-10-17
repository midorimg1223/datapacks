#By ZCode —— 平板 · 初始化（steve 的武器）
# 右键检测：诡异菌钓竿的 used 统计（和亡魂灯 / 亡灵之镐各记各的，互不冲突）
scoreboard objectives add tablet.rc minecraft.used:minecraft.warped_fungus_on_a_stick
# 冷却：轻击 10 tick（0.5 秒）/ 重击 30 tick（1.5 秒）
scoreboard objectives add tablet.cd_light dummy
scoreboard objectives add tablet.cd_heavy dummy
# 记账用的临时分数（调用 pool_damage 之前把数值写进来）
scoreboard objectives add tablet.dmg dummy
