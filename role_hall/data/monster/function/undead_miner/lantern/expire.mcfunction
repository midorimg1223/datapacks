#By ZCode —— 寿命到了（放下后 1 分 30 秒）：熄灭音 + 拆掉灯并移除锚点
# 执行位置 = 灯所在方块，@s = 锚点 marker
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~ ~ ~ 1 0.8
setblock ~ ~ ~ air
kill @s
