#By ZCode —— 清掉所有悬浮字（board_text 标签的全部）
kill @e[tag=board_text]
tellraw @s [{"text":"[悬浮字] ","color":"gold"},{"text":"已清掉所有悬浮字","color":"gray"}]
