#By ZCode —— 编辑离你最近的那个悬浮字（8 格内）
# 内容来自 storage board:edit text（形状就是文本组件本身，所以不用写 JSON 转义）：
#   /data modify storage board:edit text set value {text:"亡灵矿区",color:"gold"}
#   /data modify storage board:edit text set value {text:"危险",color:"red",bold:true}
# 外观来自 storage board:edit display（可省）：
#   /data modify storage board:edit display set value {billboard:"center",size:1.5d}
#   改完执行：/function board:text_edit
# billboard 可选：center（正对玩家）/ vertical / horizontal / fixed（固定朝向，像牌子）

# 缺字段就补默认值：宏函数缺变量会直接报错，先兜住
execute unless data storage board:edit text run data modify storage board:edit text set value {text:"悬浮字",color:"white"}
execute unless data storage board:edit display.billboard run data modify storage board:edit display.billboard set value "center"
execute unless data storage board:edit display.size run data modify storage board:edit display.size set value 1.0d

execute unless entity @e[tag=board_text,distance=..8] run tellraw @s [{"text":"[悬浮字] ","color":"gold"},{"text":"8 格内没有悬浮字：站到它旁边，或者先用 board:text_place 放一个","color":"red"}]
execute if entity @e[tag=board_text,distance=..8] run tellraw @s [{"text":"[悬浮字] ","color":"gold"},{"text":"已更新最近的那个","color":"gray"}]
execute as @e[tag=board_text,sort=nearest,limit=1,distance=..8] run function board:text_apply with storage board:edit display
