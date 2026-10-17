#By ZCode —— 「猎人」告示牌点击入口（@s = 点击的玩家）
# advancement 只留触发器、不带条件：26.3 里无效的 advancement 会直接让世界加载失败，风险太大
# 判定改在这里做：先撤销以便下次还能触发，再看玩家眼睛前 2 格内有没有对应的点击按钮
advancement revoke @s only board:info_hunter
execute anchored eyes positioned ^ ^ ^2 if entity @e[type=interaction,tag=info_hunter,distance=..1.5] run function board:hunter_text
