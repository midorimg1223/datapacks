#By ZCode —— 使用「速度提升」（@s = 使用者，任何人都能用）
# 由 tick 筛出「统计到右键」的玩家，这里再确认手里就是它
# 效果：加速 6.5 秒（130 tick，Speed I）+ 回血 + 音效
# ★ 顺序很重要：消耗物品（clear）必须放在最后
#   否则 clear 之后再判断"手里是不是它"就会失败，音效/后续步骤全都不执行
#   角色（steve / 亡灵矿工）-> 加各自的血池；没有血池的 -> 直接回原版生命
# 一次性：用掉就没了

# 加速：/effect give 的时长单位是「秒」且只收整数，做不出 6.5 秒
#       所以给无限时长，再用 steve.spd 计时器精确倒计时 130 tick（6.5 秒）后收掉
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run effect give @s minecraft:speed infinite 0 true
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run scoreboard players set @s steve.spd 130
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] at @s run playsound mcdd:speed master @a[distance=..16] ~ ~ ~ 1 1
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run effect give @s minecraft:instant_health 1 1 true

# steve 血池（存在才加，上限 100）
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] if score @s steve.hp matches -1000000.. run scoreboard players add @s steve.hp 30
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] if score @s steve.hp matches 151.. run scoreboard players set @s steve.hp 150

# 亡灵矿工血池（存在才加，上限 250）
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] if score @s undead_miner.hp matches -1000000.. run scoreboard players add @s undead_miner.hp 30
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] if score @s undead_miner.hp matches 251.. run scoreboard players set @s undead_miner.hp 250

# 消耗（放最后一行，不能再往后加任何依赖"手里有它"的命令）
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run clear @s warped_fungus_on_a_stick[minecraft:custom_data~{Tags:["adrenaline"]}] 1
# 用掉了 —— 这时候才把充能清空
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run scoreboard players set @s steve.charge 0
execute if items entity @s weapon.mainhand *[custom_data~{Tags:["adrenaline"]}] run scoreboard players set @s steve.charged 0
