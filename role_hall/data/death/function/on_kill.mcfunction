#By ZCode —— 有人被玩家击杀（@s = 击杀者，由 advancement death:kill 触发）
# 成就只触发一次，必须先撤销，否则整个存档只有第一次击杀能打上标记
advancement revoke @s only death:kill
# 只打一个标记，死者那边在自己的死亡提示里用这个标记显示出"死于谁"
# killttl 让标记在 1 秒后失效，避免旧击杀者被误认成凶手
scoreboard players set @s death.killflag 1
scoreboard players set @s death.killttl 20
