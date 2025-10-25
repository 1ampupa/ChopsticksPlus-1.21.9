# Recall
$tp @a[tag=csp29.recalling] $(x) $(y) $(z)

# Post-recall Phase

effect give @a[tag=csp29.recalling] minecraft:regeneration 3 4
effect give @a[tag=csp29.recalling] minecraft:speed 20 1

execute as @a[tag=csp29.recalling] at @s run playsound minecraft:item.mace.smash_ground_heavy neutral @a ~ ~ ~ 1 0
execute as @a[tag=csp29.recalling] at @s run playsound minecraft:item.trident.riptide_1 neutral @a ~ ~ ~ 1 0
execute as @a[tag=csp29.recalling] at @s run playsound minecraft:block.beacon.activate neutral @a ~ ~ ~ 1 1

execute as @a[tag=csp29.recalling] at @s run particle minecraft:firework ~ ~ ~ 1 1 1 0.75 200

tellraw @a[tag=csp29.recalling] {text:"Recall completed! Recall cooldown active for 3 minutes.",color:"green",bold:false}
title @a[tag=csp29.recalling] title ""
title @a[tag=csp29.recalling] subtitle {text:"Back to safety.",bold:true,color:"green"}

scoreboard players set @a[tag=csp29.recalling] csp29.recallCooldown 3600
tag @a[tag=csp29.recalling] remove csp29.recalling
