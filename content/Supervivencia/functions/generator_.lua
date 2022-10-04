	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	
	generator = {
		id1 = 0, id2 = 0, timer = 0, info1 = 0, info2 = 0, state = "alive",
		health = 95, max_health = 100, damage_m = 1.0, power = 60 * 30, progress = 0
	}

function update_generator()
	if generator.state == "alive" then
		if if_dead(ship_id) then generator.state = "end" end
		local n = find_timer(generator.timer)
		local x, y = pewpew.entity_get_position(ship_id)
		if timers[n].time > 1800 then timers[n].time = 1800 end
		generator.power = timers[n].time
		if generator.power > 0 then generator.progress = generator.progress + 1 end
		if generator.progress >= 1800 then
			generator.progress = 0
			create_message(x, y + 50fx, "+Progress", 0xd3c151ff, 5)
			add_shield(3)
			generator.health = generator.health + 10 + waves.wave
		end
		if generator.health > generator.max_health then generator.health = generator.max_health end
		if generator.health <= 0 then
			generator.state = "dead"
			create_message(x, y + 50fx, "Generator was destroyed!", 0xf15121ff, 2)
			pewpew.customizable_entity_start_exploding(generator.id1, 90)
			pewpew.customizable_entity_start_exploding(generator.id2, 90)
			destroy_text(generator.timer, "0:00", 0xa1c121a1, 3)
			destroy_text(generator.info1, "Progress:0%", 0xf19921a1, 3)
			destroy_text(generator.info2, "Health:0", 0x21d141a1, 3)
			--"Health:0/"..generator.max_health
		end
	end
end
