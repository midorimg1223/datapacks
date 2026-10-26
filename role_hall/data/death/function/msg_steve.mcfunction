#By ZCode —— 宏：击杀者是槽位 $(slot) 的 steve
$title @a[tag=death_victim] subtitle [{"text":"被 ","color":"red"},{"selector":"@a[tag=steve,scores={steve.slot=$(slot)}]","color":"white","bold":true},{"text":" 击杀","color":"red"}]
$execute as @a[tag=steve,scores={steve.slot=$(slot)}] run title @s times 5 40 10
$execute as @a[tag=steve,scores={steve.slot=$(slot)}] run title @s title [{"text":"击杀！","color":"dark_red","bold":true}]
$execute as @a[tag=steve,scores={steve.slot=$(slot)}] run title @s subtitle [{"selector":"@a[tag=death_victim]","color":"white","bold":true},{"text":" 被击杀","color":"gray"}]
$execute as @a[tag=steve,scores={steve.slot=$(slot)}] run tellraw @a [{"selector":"@s","color":"red"},{"text":" 击杀了 ","color":"gray"},{"selector":"@a[tag=death_victim]","color":"white"}]
$execute as @a[tag=steve,scores={steve.slot=$(slot)}] at @s run playsound mcdd:streak1 master @s ~ ~ ~ 1 1
