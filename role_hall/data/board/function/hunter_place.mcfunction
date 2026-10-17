#By ZCode —— 在脚下放一个「猎人」告示牌点击按钮（@s = 执行者）
# 用 interaction 实体：隐形、无敌、没有背包（玩家偷不走任何东西），右键必定触发 advancement
# 尺寸 1.2 略大于一格，让它的判定面比告示牌靠前一点点，保证右键打到的是它而不是牌子
# 放好后把告示牌摆在同一格
execute at @s align xyz run summon minecraft:interaction ~0.5 ~ ~0.5 {Tags:["sign_info","info_hunter"],width:1.2f,height:1.2f,response:1b}
tellraw @s [{"text":"[告示牌按钮] ","color":"gold"},{"text":"已在脚下生成「猎人」点击按钮，把告示牌放到这一格就行","color":"gray"}]
