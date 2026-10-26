#By ZCode —— 生命条 · 初始化（方案 A：抗性挡原版伤害，伤害源自己上报）
# bossbar 的 ID 只能是 [a-z0-9_.-]（不能用中文）；中文只能作为"显示名"
scoreboard objectives add undead_miner.hp dummy
scoreboard objectives add undead_miner.slot dummy
scoreboard objectives add undead_miner.dmg dummy
scoreboard objectives add undead_miner.dead dummy

bossbar add undead_miner1 {text:"血量",color:"red"}
bossbar set undead_miner1 color red
bossbar set undead_miner1 max 250
bossbar set undead_miner1 style notched_20
bossbar add undead_miner2 {text:"血量",color:"red"}
bossbar set undead_miner2 color red
bossbar set undead_miner2 max 250
bossbar set undead_miner2 style notched_20
bossbar add undead_miner3 {text:"血量",color:"red"}
bossbar set undead_miner3 color red
bossbar set undead_miner3 max 250
bossbar set undead_miner3 style notched_20
bossbar add undead_miner4 {text:"血量",color:"red"}
bossbar set undead_miner4 color red
bossbar set undead_miner4 max 250
bossbar set undead_miner4 style notched_20
bossbar add undead_miner5 {text:"血量",color:"red"}
bossbar set undead_miner5 color red
bossbar set undead_miner5 max 250
bossbar set undead_miner5 style notched_20
bossbar add undead_miner6 {text:"血量",color:"red"}
bossbar set undead_miner6 color red
bossbar set undead_miner6 max 250
bossbar set undead_miner6 style notched_20
scoreboard objectives add undead_miner.issued dummy
scoreboard objectives add undead_miner.full dummy
