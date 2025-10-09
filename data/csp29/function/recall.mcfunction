# Pre-recall Phase
execute at @a[tag=csp29.recalling] run playsound minecraft:block.beacon.ambient neutral @s ~ ~ ~ 1.5 1.1

schedule function csp29:recall/activate 5s

effect give @a[tag=csp29.recalling] minecraft:resistance 6 4 true
effect give @a[tag=csp29.recalling] minecraft:slowness 5 255 true
effect give @a[tag=csp29.recalling] minecraft:blindness 6 255 true

title @a[tag=csp29.recalling] title {"text":"RECALLING","color":"aqua","bold":true}
title @a[tag=csp29.recalling] subtitle {"text":"Back to safety in 5 seconds..."}
