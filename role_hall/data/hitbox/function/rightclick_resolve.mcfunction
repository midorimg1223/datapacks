#By ZCode —— 宏：$(uuid) 是右键者的 UUID（由 rightclick.mcfunction 从盒子 NBT 复制进 storage）
$execute as @e[nbt={UUID:$(uuid)}] at @s run function hitbox:use_dispatch
