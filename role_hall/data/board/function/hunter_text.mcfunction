#By ZCode —— 猎人技能说明正文（@s = 点击的玩家）
# 点击音效（只给点的人听）
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
tellraw @s [{"text":"──────── 猎人 ────────","color":"dark_red","bold":true}]
tellraw @s [{"text":"主武器：","color":"yellow"},{"text":"猎斧","color":"white"},{"text":"  —— 左键平砍","color":"gray"}]
tellraw @s [{"text":"技能1 · 捕兽夹","color":"red"},{"text":"  （CD 60 秒）","color":"dark_gray"}]
tellraw @s [{"text":"   在脚下放置捕兽夹。凡人踩中会被夹住，只能低头拆除，期间位置暴露。","color":"gray"}]
tellraw @s [{"text":"技能2 · 兄弟重生","color":"red"},{"text":"  （CD 120 秒）","color":"dark_gray"}]
tellraw @s [{"text":"   召唤 2 个猎人追击玩家；被追到的玩家损失 20%~30% 血量，并被失明、缓慢。","color":"gray"}]
tellraw @s [{"text":"大招 · 猎杀","color":"red"},{"text":"  （CD 120 秒）","color":"dark_gray"}]
tellraw @s [{"text":"   10 秒内移动速度与力量提升；期间免疫所有陷阱道具的效果。","color":"gray"}]
