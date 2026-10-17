#By ZCode —— 同步一条"steve"血条
# 调用方：as <玩家>；参数由 storage death:bar.steveN 提供（bar = 血条 ID，hp = 当前血量）
$bossbar set $(bar) max 150
$bossbar set $(bar) value $(hp)
$bossbar set $(bar) name {"text":"血量 ($(hp)/150)","color":"red"}
