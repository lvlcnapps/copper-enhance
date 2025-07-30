execute as @a run item modify entity @s[scores={charge_boots = 1..}] armor.feet copper:copper_boots
execute as @a run item modify entity @s[scores={charge_leggings = 1..}] armor.legs copper:copper_leggings
execute as @a run item modify entity @s[scores={charge_chestplate = 1..}] armor.chest copper:copper_chestplate
execute as @a run item modify entity @s[scores={charge_helmet = 1..}] armor.head copper:copper_helmet

effect give @a[scores={charged_hit = 1.., charge_boots = 1..}] minecraft:resistance 2 3 true
effect give @a[scores={charged_hit = 1.., charge_boots = 1..}] minecraft:saturation 2 3 true
effect give @a[scores={charged_hit = 1.., charge_boots = 1..}] minecraft:fire_resistance 2 3 true

effect give @a[scores={charged_hit = 1.., charge_leggings = 1..}] minecraft:resistance 2 3 true
effect give @a[scores={charged_hit = 1.., charge_leggings = 1..}] minecraft:saturation 2 3 true
effect give @a[scores={charged_hit = 1.., charge_leggings = 1..}] minecraft:fire_resistance 2 3 true

effect give @a[scores={charged_hit = 1.., charge_chestplate = 1..}] minecraft:resistance 2 3 true
effect give @a[scores={charged_hit = 1.., charge_chestplate = 1..}] minecraft:saturation 2 3 true
effect give @a[scores={charged_hit = 1.., charge_chestplate = 1..}] minecraft:fire_resistance 2 3 true

effect give @a[scores={charged_hit = 1.., charge_helmet = 1..}] minecraft:resistance 2 3 true
effect give @a[scores={charged_hit = 1.., charge_helmet = 1..}] minecraft:saturation 2 3 true
effect give @a[scores={charged_hit = 1.., charge_helmet = 1..}] minecraft:fire_resistance 2 3 true

scoreboard players set @a full_charge 0
execute as @a run scoreboard players operation @s full_charge += @s charge_leggings
execute as @a run scoreboard players operation @s full_charge += @s charge_boots
execute as @a run scoreboard players operation @s full_charge += @s charge_chestplate
execute as @a run scoreboard players operation @s full_charge += @s charge_helmet

execute as @e at @s on attacker run execute if entity @s[scores={charged_hit = 1.., full_charge = 1..}, nbt={SelectedItem:{id:"minecraft:copper_sword"}}] run summon minecraft:lightning_bolt ~ ~ ~
# execute as @e at @s on attacker run 

execute as @a[scores={charged_hit = 1.., charge_boots = 1..}] run function copper:reduce_charge_boots
execute as @a[scores={charged_hit = 1.., charge_leggings = 1.., charge_boots = ..0}] run function copper:reduce_charge_leggings
execute as @a[scores={charged_hit = 1.., charge_chestplate = 1.., charge_leggings = ..0, charge_boots = ..0}] run function copper:reduce_charge_chestplate
execute as @a[scores={charged_hit = 1.., charge_helmet = 1.., charge_chestplate = ..0, charge_leggings = ..0, charge_boots = ..0}] run function copper:reduce_charge_helmet
scoreboard players set @a charged_hit 0

execute as @a store result score @s charge_boots run data get entity @s equipment.feet.components.minecraft:custom_data.charge
execute as @a store result score @s charge_leggings run data get entity @s equipment.legs.components.minecraft:custom_data.charge
execute as @a store result score @s charge_chestplate run data get entity @s equipment.chest.components.minecraft:custom_data.charge
execute as @a store result score @s charge_helmet run data get entity @s equipment.head.components.minecraft:custom_data.charge

item modify entity @a[scores={full_charge = ..0}] weapon.mainhand copper:make_not_glow
item modify entity @a[scores={full_charge = 1..}] weapon.mainhand copper:make_glow

execute as @a at @s if entity @n[type=minecraft:lightning_bolt,distance=..2] if block ~ ~-1 ~ minecraft:lightning_rod run function copper:full_charge