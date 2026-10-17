#By ZCode —— 亡魂灯 初始化
# 右键检测：诡异菌钓竿的 used 统计（故意不用胡萝卜钓竿，避免和 M&M 抢同一个统计）
scoreboard objectives add soul_lantern.rc minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add soul_lantern.sb dummy
scoreboard objectives add soul_lantern.flag dummy
scoreboard objectives add soul_lantern.age dummy
scoreboard objectives add soul_lantern.warn dummy
scoreboard objectives add soul_lantern.tp trigger
# 提示只发给亡灵矿工，凡人看不到这套机制的存在
