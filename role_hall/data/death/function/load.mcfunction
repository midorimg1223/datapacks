#By ZCode —— 死亡 / 幽灵 / 重生 系统 · 初始化
# deaths: 原版内置的死亡次数统计（每死一次 +1），用它来检测死亡
scoreboard objectives add deaths deathCount
# 30 秒倒计时（600 tick）
scoreboard objectives add death.timer dummy
# 死亡前的游戏模式：0 生存 / 1 创造 / 2 冒险 / 3 旁观
scoreboard objectives add death.gm dummy
# 死亡前拥有的角色 tag
scoreboard objectives add death.was_miner dummy
scoreboard objectives add death.was_steve dummy
scoreboard objectives add death.was_mortal dummy
# 击杀者标记（死者那边靠它在死亡提示里显示"死于谁"）
scoreboard objectives add death.killflag dummy
# 击杀标记的有效期（1 秒 = 20 tick，过期就不算击杀者了）
scoreboard objectives add death.killttl dummy
# 显示用的临时计分项（算剩余秒数）
scoreboard objectives add death.sec dummy
scoreboard objectives add death.attacker_kind dummy
scoreboard objectives add death.attacker_slot dummy
scoreboard objectives add death.attacker_ttl dummy
