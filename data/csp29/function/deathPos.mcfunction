# Set tag for Players who just died
execute as @a if score @s csp29.deathPos matches 1.. run tag @s add csp29.deathPos

# Get death position for all players who have the tag

# X
execute as @a[tag=csp29.deathPos] store result storage csp29:deathpos Position.x int 1 \
 run data get entity @s Pos[0] 1

# Y
execute as @a[tag=csp29.deathPos] store result storage csp29:deathpos Position.y int 1 \
 run data get entity @s Pos[1] 1

# Z
execute as @a[tag=csp29.deathPos] store result storage csp29:deathpos Position.z int 1 \
 run data get entity @s Pos[2] 1

# Tellraw players their death position
tellraw @a[tag=csp29.deathPos] [{text:"[Death Position] ",color:"yellow",bold:1},\
 {text:"Your last death position is ",color:"white",bold:0}, \
 {nbt:"Position.x",storage:"csp29:deathpos",color:"red",bold:1}," ", \
 {nbt:"Position.y",storage:"csp29:deathpos",color:"green",bold:1}," ", \
 {nbt:"Position.z",storage:"csp29:deathpos",color:"blue",bold:1}]

# Reset deathPos scoreboard for all players who have the tag
execute as @a[tag=csp29.deathPos] run scoreboard players reset @s csp29.deathPos
tag @a[tag=csp29.deathPos] remove csp29.deathPos
