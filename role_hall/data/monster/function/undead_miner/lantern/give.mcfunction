#By ZCode —— 发一盏亡魂灯（基座是诡异菌钓竿，只是显示成灵魂灯笼）
# 先清掉身上已有的同款，再发 1 个：不管执行几次，结果都只有 1 个
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["soul_lantern"]}]
give @s minecraft:warped_fungus_on_a_stick[minecraft:item_model="minecraft:soul_lantern",minecraft:custom_name={text:"亡魂灯",color:"aqua",italic:false},minecraft:lore=[{text:"右键：在原地放下一盏亡魂灯",color:"gray",italic:false},{text:"凡人靠近会被失明、缓慢，并暴露位置",color:"dark_gray",italic:false}],minecraft:custom_data={Tags:["soul_lantern"]},minecraft:enchantment_glint_override=true,minecraft:rarity="rare"] 1
