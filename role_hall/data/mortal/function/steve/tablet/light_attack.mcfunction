#By ZCode —— 轻击入口（@s = 攻击者），由 advancement mortal:steve/tablet/light_hit（player_hurt_entity）触发
# 原版左键空挥没有事件，所以只在真的打中实体时才响
advancement revoke @s only mortal:steve/tablet/light_hit
# 把冷却分数建出来：未初始化的分数在 matches ..0 判定里会直接失败，会静默吃掉这次攻击
scoreboard players add @s tablet.cd_light 0
execute if score @s tablet.cd_light matches ..0 if items entity @s weapon.mainhand *[custom_data~{Tags:["tablet"]}] run function mortal:steve/tablet/light_effect
