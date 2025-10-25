# Get day
execute store result score day csp29.clock run time query day

# Get daytime for hour
execute store result score daytime csp29.clock run time query daytime

# HOUR

# Get Hour (daytime / 1000 + 6 <- Offset; Hour max at 24)
execute store result score hour csp29.clock run \
 scoreboard players operation daytime csp29.clock /= hour_divisor csp29.clock.settings

# Set Hour Offset (6:00 starts at tick 0)
scoreboard players operation hour csp29.clock += hour_offset csp29.clock.settings

# Fix Hour error if hour past midnight / 24 (Reset to 0)
execute if score hour csp29.clock matches 24.. run \ 
 scoreboard players operation hour csp29.clock -= hour_past_midnight_offset csp29.clock.settings

# MINUTE

# Get daytime for minute
execute store result score daytime csp29.clock run time query daytime

# Get Minute by get the remainder of hour (daytime % 1000)
execute store result score minute csp29.clock run \
 scoreboard players operation daytime csp29.clock %= hour_divisor csp29.clock.settings

# Convert minute to hour to remove decimal (Remainder of hour * 60)
scoreboard players operation minute csp29.clock *= minute_divisor csp29.clock.settings

# Get Minute from hour (MinuteInHour / 1000)
scoreboard players operation minute csp29.clock /= hour_divisor csp29.clock.settings

# Get daytime for query
execute store result score daytime csp29.clock run time query daytime

# DISPLAY DAY ... HH:MM

# Give tag 'csp29.clock' to players who holding a clock
execute as @a if entity @s[nbt={SelectedItem:{id:"minecraft:clock"}}] run tag @s add csp29.clock

# HH:MM if Hour < 10 and Minute < 10    e.g. 0:5 -> 00:05
execute if score hour csp29.clock matches 0..9 run \ 
 execute if score minute csp29.clock matches 0..9 run \
 title @a[tag=csp29.clock] actionbar [{text:"DAY ", color:"yellow", bold:false},\ 
 {score:{objective:"csp29.clock", name:"day"}, color:"yellow", bold:true}, \ 
 {text:" 0", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"hour"}, color:"white", bold:true}, \ 
 {text:":0", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"minute"}, color:"white", bold:true}]

# H:MM if Hour >= 10 and Minute < 10    e.g. 10:0 -> 10:00
execute if score hour csp29.clock matches 10..23 run \ 
 execute if score minute csp29.clock matches 0..9 run \
 title @a[tag=csp29.clock] actionbar [{text:"DAY ", color:"yellow", bold:false},\ 
 {score:{objective:"csp29.clock", name:"day"}, color:"yellow", bold:true}, \ 
 {text:" ", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"hour"}, color:"white", bold:true}, \ 
 {text:":0", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"minute"}, color:"white", bold:true}]

# HH:M if Hour < 10 and Minute >= 10    e.g. 6:30 -> 06:30
execute if score hour csp29.clock matches 0..9 run \ 
 execute if score minute csp29.clock matches 10..59 run \
 title @a[tag=csp29.clock] actionbar [{text:"DAY ", color:"yellow", bold:false},\ 
 {score:{objective:"csp29.clock", name:"day"}, color:"yellow", bold:true}, \ 
 {text:" 0", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"hour"}, color:"white", bold:true}, \ 
 {text:":", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"minute"}, color:"white", bold:true}]

# H:M if Hour >= 10 and Minute >= 10    e.g. 15:45 -> 15:45
execute if score hour csp29.clock matches 10..23 run \ 
 execute if score minute csp29.clock matches 10..59 run \
 title @a[tag=csp29.clock] actionbar [{text:"DAY ", color:"yellow", bold:false},\ 
 {score:{objective:"csp29.clock", name:"day"}, color:"yellow", bold:true}, \ 
 {text:" ", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"hour"}, color:"white", bold:true}, \ 
 {text:":", color:"white", bold:true}, \
 {score:{objective:"csp29.clock", name:"minute"}, color:"white", bold:true}]

# Remove the 'csp29.clock' tag from players
execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:clock"}}] run tag @s[tag=csp29.clock] remove csp29.clock
