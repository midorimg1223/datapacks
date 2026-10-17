#By ZCode —— 把 storage 里的内容/外观套到 @s 这个悬浮字上（宏函数，@s = text_display）
# text 的形状和文本组件一模一样，所以能整块搬过去，颜色/加粗/斜体都跟着走
# 注意：宏变量本身带后缀（1.5d），所以列表里直接写 $(size)，不要再补 f
# 注意：transformation 的编解码要求四个字段全写，少一个整条会被丢掉（缩放就不生效）
data modify entity @s text set from storage board:edit text
$data modify entity @s billboard set value $(billboard)
$data modify entity @s transformation set value {translation:[0f,0f,0f],left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],scale:[$(size),$(size),$(size)]}
