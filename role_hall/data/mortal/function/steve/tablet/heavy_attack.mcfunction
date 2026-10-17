#By ZCode —— 重击入口（@s = 攻击者）：冷却中静默，不给任何提示
# 把冷却分数建出来：未初始化的分数在 matches ..0 判定里会直接失败，会静默吃掉这次攻击
scoreboard players add @s tablet.cd_heavy 0
execute if score @s tablet.cd_heavy matches ..0 run function mortal:steve/tablet/heavy_effect
