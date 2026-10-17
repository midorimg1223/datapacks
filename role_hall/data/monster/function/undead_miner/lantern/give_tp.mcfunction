#By ZCode —— 发一枚「回魂令」（亡灵矿工用它右键传送到暴露中的亡魂灯）
# 先清掉身上已有的同款，再发 1 个：不会越攒越多
# 想换外观就改 item_model 那一段，比如 minecraft:ender_pearl
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["soul_lantern_tp"]}]
give @s minecraft:warped_fungus_on_a_stick[minecraft:item_model="minecraft:soul_torch",minecraft:custom_name={text:"回魂令",color:"light_purple",italic:false},minecraft:lore=[{text:"右键：传送到正在暴露凡人的亡魂灯",color:"gray",italic:false},{text:"只有亡灵矿工能用",color:"dark_gray",italic:false}],minecraft:custom_data={Tags:["soul_lantern_tp"]},minecraft:enchantment_glint_override=true,minecraft:rarity="rare"] 1
