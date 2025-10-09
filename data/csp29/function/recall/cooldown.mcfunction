execute as @a if score @s csp29.recallCooldown matches 1.. run scoreboard players reset @s recall

execute as @a if score @s csp29.recallCooldown matches 1.. run scoreboard players remove @s csp29.recallCooldown 1

execute as @a if score @s csp29.recallCooldown matches 1.. run title @s actionbar \
[{"text":"Recall on cooldown, ","color":"yellow","bold":false},\
{"score":{"objective":"csp29.recallCooldown","name":"@s"},"color":"yellow","bold":true},\
{"text":" Ticks remaining","color":"yellow","bold":false}]

execute as @a if score @s csp29.recallCooldown matches 0 run title @s title ""

execute as @a if score @s csp29.recallCooldown matches 0 run title @s subtitle \
{"text":"Recall is READY to use!","color":"green","bold":true}

execute as @a if score @s csp29.recallCooldown matches 0 run scoreboard players set @s csp29.recallCooldown -1
execute as @a if score @s csp29.recallCooldown matches ..0 run scoreboard players enable @s recall
