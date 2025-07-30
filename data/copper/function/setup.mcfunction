scoreboard objectives add charge_boots dummy
scoreboard objectives add charge_leggings dummy
scoreboard objectives add charge_chestplate dummy
scoreboard objectives add charge_helmet dummy
scoreboard objectives add full_charge dummy
scoreboard objectives add charged_hit minecraft.used:minecraft.copper_sword
scoreboard objectives add temp dummy
scoreboard players set .charge temp 1
summon minecraft:item_display 5 -65 5 {UUID:[I; 9, 0, 0, 9], Invisible: 1b}

say started