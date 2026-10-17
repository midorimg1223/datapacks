#By ZCode —— steve 角色 · 初始化
scoreboard objectives add steve.hp dummy
scoreboard objectives add steve.slot dummy
scoreboard objectives add steve.dmg dummy
scoreboard objectives add steve.dead dummy
scoreboard objectives add steve.spd dummy

bossbar add steve1 {text:"血量",color:"red"}
bossbar set steve1 color red
bossbar set steve1 max 150
bossbar set steve1 style notched_20
bossbar add steve2 {text:"血量",color:"red"}
bossbar set steve2 color red
bossbar set steve2 max 150
bossbar set steve2 style notched_20
bossbar add steve3 {text:"血量",color:"red"}
bossbar set steve3 color red
bossbar set steve3 max 150
bossbar set steve3 style notched_20
bossbar add steve4 {text:"血量",color:"red"}
bossbar set steve4 color red
bossbar set steve4 max 150
bossbar set steve4 style notched_20
bossbar add steve5 {text:"血量",color:"red"}
bossbar set steve5 color red
bossbar set steve5 max 150
bossbar set steve5 style notched_20
bossbar add steve6 {text:"血量",color:"red"}
bossbar set steve6 color red
bossbar set steve6 max 150
bossbar set steve6 style notched_20

# ---- 充能值（0~100，形式类似血池）----
scoreboard objectives add steve.charge dummy
scoreboard objectives add steve.charged dummy
bossbar add steve_charge1 {text:"充能",color:"aqua"}
bossbar set steve_charge1 color blue
bossbar set steve_charge1 max 100
bossbar set steve_charge1 style notched_10
bossbar add steve_charge2 {text:"充能",color:"aqua"}
bossbar set steve_charge2 color blue
bossbar set steve_charge2 max 100
bossbar set steve_charge2 style notched_10
bossbar add steve_charge3 {text:"充能",color:"aqua"}
bossbar set steve_charge3 color blue
bossbar set steve_charge3 max 100
bossbar set steve_charge3 style notched_10
bossbar add steve_charge4 {text:"充能",color:"aqua"}
bossbar set steve_charge4 color blue
bossbar set steve_charge4 max 100
bossbar set steve_charge4 style notched_10
bossbar add steve_charge5 {text:"充能",color:"aqua"}
bossbar set steve_charge5 color blue
bossbar set steve_charge5 max 100
bossbar set steve_charge5 style notched_10
bossbar add steve_charge6 {text:"充能",color:"aqua"}
bossbar set steve_charge6 color blue
bossbar set steve_charge6 max 100
bossbar set steve_charge6 style notched_10
data modify storage death:charge steve1.bar set value "steve_charge1"
data modify storage death:charge steve2.bar set value "steve_charge2"
data modify storage death:charge steve3.bar set value "steve_charge3"
data modify storage death:charge steve4.bar set value "steve_charge4"
data modify storage death:charge steve5.bar set value "steve_charge5"
data modify storage death:charge steve6.bar set value "steve_charge6"
scoreboard objectives add steve.issued dummy
