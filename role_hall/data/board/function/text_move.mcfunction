#By ZCode —— 把离你最近的那个悬浮字挪到你脚下（8 格内）
execute at @s align xyz run tp @e[tag=board_text,sort=nearest,limit=1,distance=..8] ~0.5 ~1 ~0.5
tellraw @s [{"text":"[悬浮字] ","color":"gold"},{"text":"已把最近的那个挪到你脚下","color":"gray"}]
