#By ZCode —— 发一把「平板」（steve 的武器）
# 基座是诡异菌钓竿（右键才有可检测的 used 统计），item_model 指向资源包里的自定义贴图
# 故意不挂 attribute_modifiers：原版左键保持 1 点，轻击的 10 点由 light_effect 补 9 点凑齐
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["tablet"]}]
give @s minecraft:warped_fungus_on_a_stick[minecraft:item_model="mcdd:tablet",minecraft:custom_name={text:"平板",color:"white",italic:false},minecraft:lore=[{text:"左键 轻击：10 伤害 / 0.5 秒",color:"dark_gray",italic:false},{text:"右键 重击：15 伤害 / 1.5 秒",color:"dark_gray",italic:false}],minecraft:custom_data={Tags:["tablet"]},minecraft:unbreakable={},minecraft:enchantment_glint_override=true,minecraft:rarity="epic"] 1
scoreboard players set @s steve.issued 1
tellraw @s [{"text":"[平板] ","color":"white"},{"text":"已发放","color":"gray"}]
