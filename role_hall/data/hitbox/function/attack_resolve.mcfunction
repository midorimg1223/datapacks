#By ZCode —— 宏：$(uuid) 是攻击者的 UUID（由 attack.mcfunction 从盒子 NBT 复制进 storage）
# at @s 不能少：判定要以"攻击者自己"为原点、用他自己的朝向
$execute as @e[nbt={UUID:$(uuid)}] at @s run function hitbox:attack_dispatch
