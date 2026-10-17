#By ZCode —— 发一把亡灵之镐
# 基座是诡异菌钓竿（右键才有可检测的 used 统计），item_model 指向资源包里的自定义贴图
# 故意不挂 attribute_modifiers：原版左键保持 1 点，轻击的 10 点由 light_effect 补 9 点凑齐
# （这样"轻击 10 / 重击 20"两个数字都只在函数里改一处）
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_pickaxe"]}]
give @s minecraft:warped_fungus_on_a_stick[minecraft:item_model="mcdd:undead_pickaxe",minecraft:custom_name={text:"亡灵之镐",color:"red",italic:false},minecraft:lore=[{text:"亡者之息凝于镐尖，永不磨损。",color:"gray",italic:false},{text:"左键 轻击：10 伤害 / 0.6 秒",color:"dark_gray",italic:false},{text:"右键 重击：20 伤害 / 2 秒",color:"dark_gray",italic:false}],minecraft:unbreakable={},minecraft:custom_data={Tags:["undead_pickaxe"]},minecraft:enchantment_glint_override=true,minecraft:rarity="epic"] 1
scoreboard players set @s undead_miner.issued 1
tellraw @s [{"text":"[亡灵之镐] ","color":"red"},{"text":"已发放","color":"gray"}]
