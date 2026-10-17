#By ZCode —— 发一个「亡马之魂」（消耗品，右键使用）
# 基座还是诡异菌钓竿，只是显示成僵尸马刷怪蛋的模型（item_model 指到原版模型，不需要资源包）
# 先清掉身上已有的同款，再发 1 个：不管执行几次，结果都只有 1 个
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_horse_soul"]}]
give @s minecraft:warped_fungus_on_a_stick[minecraft:item_model="minecraft:zombie_horse_spawn_egg",minecraft:custom_name={text:"亡马之魂",color:"dark_purple",italic:false},minecraft:lore=[{text:"右键使用：速度 I + 力量 I，持续 10 秒",color:"gray",italic:false},{text:"并唤出一声僵尸马的嘶鸣",color:"dark_gray",italic:false}],minecraft:custom_data={Tags:["undead_horse_soul"]},minecraft:enchantment_glint_override=true,minecraft:rarity="rare"] 1
tellraw @s [{"text":"[亡马之魂] ","color":"dark_purple"},{"text":"获得 1 个（右键使用）","color":"gray"}]
