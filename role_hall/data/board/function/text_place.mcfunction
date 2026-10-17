#By ZCode —— 在你脚下放一个悬浮字（可编辑）
# 用法：站到要放的位置 → /function board:text_place → 再用 board:text_edit 改内容
# 默认：正对玩家(center)、穿墙可见、无黑底、无阴影、全亮、视距 64 格
#       （view_range 一定要显式写：不写的话默认很小，走远就看不见了）
execute at @s align xyz run summon minecraft:text_display ~0.5 ~1 ~0.5 {Tags:["board_text"],NoGravity:1b,text:{text:"悬浮字",color:"white",italic:false},billboard:"center",see_through:1b,shadow:0b,background:0,default_background:0b,brightness:{block:15,sky:15},view_range:64.0f,teleport_duration:1,interpolation_duration:2}
# 顺手把"编辑板"的默认值准备好，这样直接 /function board:text_edit 也能用
data modify storage board:edit text set value {text:"悬浮字",color:"white",italic:false}
data modify storage board:edit display set value {billboard:"center",size:1.0d}
tellraw @s [{"text":"[悬浮字] ","color":"gold"},{"text":"已在你脚下放好。","color":"gray"}]
tellraw @s [{"text":"  改内容：","color":"gray"},{"text":"/data modify storage board:edit text set value {text:\"区域名\",color:\"gold\"}","color":"yellow"}]
tellraw @s [{"text":"  然后：","color":"gray"},{"text":"/function board:text_edit","color":"yellow"},{"text":"（改离你最近的那个）","color":"gray"}]
tellraw @s [{"text":"  更多用法：","color":"gray"},{"text":"/function board:text_help","color":"yellow"}]
