#By ZCode —— 报点（@s = 灯的锚点 marker）
# 提示音
playsound minecraft:block.beacon.activate master @a[tag=undead_miner] ~ ~ ~ 1 1

# 逐人发送，保证每人只收到一条
execute as @a[tag=undead_miner] run function monster:undead_miner/lantern/alert_send
