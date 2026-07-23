execute in minecraft:overworld run forceload add 0 0 0 0
execute in minecraft:the_end run forceload add 0 0 0 0
execute in minecraft:the_nether run forceload add 0 0 0 0

function pve:.sys/notification/broadcast {text:[{text:"Loaded pupa's VanillaEnhanced Release 1.7.1 by 1ampupa\n",color:"green",bold:true}, \
{"text":"For operators, please run ",color:"yellow",bold:false}, \
{"text":"THIS FUNCTION","bold":true ,"click_event":{action:"run_command",command:"function pve:datapack_onboard"}}, \
{"text":", when you use this datapack for the first time.\n",color:"yellow",bold:false}, \
{"text":"Changelog of this release is available ",color:"white",bold:false}, \
{"text":"HERE\n","bold":true ,"click_event":{action:"show_dialog",dialog:"pve:patch_notes"}}, \
{"text":"For operators, To change the datapack settings, please ",color:"yellow",bold:false}, \
{"text":"CLICK HERE","bold":true ,"click_event":{action:"show_dialog",dialog:"pve:datapack_settings"}}, \
]}

execute as @a at @a run playsound minecraft:entity.player.levelup neutral @a ~ ~ ~ 1
