#By ZCode —— 同步一条"充能"条（上限 100）
# 调用方：as <玩家>；参数由 storage death:charge.steveN 提供（bar = 血条 ID，hp = 当前充能）
$bossbar set $(bar) max 100
$bossbar set $(bar) value $(hp)
$bossbar set $(bar) name {"text":"充能 ($(hp)/100)","color":"aqua"}
