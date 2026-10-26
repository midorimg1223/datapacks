# 在脚下放置一个幸运箱展示实体（悬浮 1 格，自动旋转）
# 用法：/function mcdd:luckbox/place
summon minecraft:item_display ~ ~1 ~ {Tags:["mcdd_luckbox","mcdd_luckbox_normal"],item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"mcdd:luckbox"}},item_display:"none",view_range:4.0f,shadow_radius:0.0f,shadow_strength:0.0f}
