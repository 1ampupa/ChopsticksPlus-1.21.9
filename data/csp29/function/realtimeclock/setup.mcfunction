# Create new scoreboard
scoreboard objectives add csp29.clock dummy
scoreboard objectives add csp29.clock.settings dummy

# Assign new values
scoreboard players set day csp29.clock 0
scoreboard players set daytime csp29.clock 0
scoreboard players set hour csp29.clock 0
scoreboard players set minute csp29.clock 0

scoreboard players set hour_divisor csp29.clock.settings 1000
scoreboard players set hour_past_midnight_offset csp29.clock.settings 24
scoreboard players set minute_divisor csp29.clock.settings 60
scoreboard players set hour_offset csp29.clock.settings 6
