#By ZCode —— 使用「亡马之魂」（@s = 使用者，调用前已确认手里是它）
# 效果：速度 + 力量各 10 秒（/effect give 的时长单位就是秒，正好 10）+ 僵尸马死亡音效
#   想更强：把速度那行的 0 改成 1 就是速度 II；力量同理
#   想改时长：把两行的 10 改掉（整数秒）
# 消耗品：用掉就没 —— 想改成可以重复使用，就删掉最后那行 clear
effect give @s minecraft:speed 10 0 true
effect give @s minecraft:strength 10 0 true
playsound minecraft:entity.zombie_horse.death master @a[distance=..16] ~ ~ ~ 1 1
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["undead_horse_soul"]}] 1
