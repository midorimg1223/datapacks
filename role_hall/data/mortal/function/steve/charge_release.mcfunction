#By ZCode —— 充能满 100：给一个「速度提升」道具并打上"已发放"标记
# 充能不在这里清零 —— 等道具真正被用掉时再清（见 adrenaline_use）
function mortal:steve/adrenaline_give
execute at @s run playsound mcdd:charge_ready master @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set @s steve.charged 1
