# Setup
scoreboard objectives add recall trigger

scoreboard objectives add csp29.recallCooldown dummy
scoreboard players set @a csp29.recallCooldown 600

tellraw @a [{text:"[Recall] ",color:"yellow",bold:true},\
{text:"Everyone received 30 seconds of recall cooldown before the first use.",color:"yellow",bold:false}]
