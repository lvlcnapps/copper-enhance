item replace entity 9-0-0-0-9 contents from entity @s armor.head
execute store result score .charge temp run data get entity 9-0-0-0-9 item.components."minecraft:custom_data".charge
execute store result storage namespace:storage modified_custom_data int 1 run scoreboard players remove .charge temp 1
item modify entity @s[scores={charge_helmet = 1..}] armor.head copper:copy_charge
item modify entity @s[scores={charge_helmet = ..1}] armor.head copper:uncharge