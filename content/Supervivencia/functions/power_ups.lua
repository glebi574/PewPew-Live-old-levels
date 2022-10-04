	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	
	bonuses = {}
	
function create_power_cell(x,y,value,spawn_time,lifetime)
	local id = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/meshes/power_cell.lua", 0)
	pewpew.customizable_entity_start_spawning(id, spawn_time)
	
	table.insert(bonuses, {
		id = id, type = "power_cell", time = value * 30, lifetime = lifetime * 30,
		dx = fmath.random_fixedpoint(-1fx, 1fx),
		dy = fmath.random_fixedpoint(-1fx, 1fx)
	})
	
	local r = 155
	local g = 116
	local b = 155
	local s = 0fx
	pewpew.entity_set_update_callback(id, function() 
		pewpew.customizable_entity_add_rotation_to_mesh(id, 0.089fx, 3fx, 7fx, 5fx)
		local color = make_color(r, g, b, 240)
		pewpew.customizable_entity_set_mesh_color(id, color)
		r = r + fmath.random_int(-3,3)
		g = g + fmath.random_int(-3,3)
		b = b + fmath.random_int(-3,3)
		if r < 100 then r = 102 end
		if g < 100 then g = 102 end
		if b < 100 then b = 102 end
		if r > 240 then r = 238 end
		if g > 240 then g = 238 end
		if b > 240 then b = 238 end
		s = s + 0.219fx
		local s_ = sin_fx(s)
		pewpew.customizable_entity_set_mesh_scale(id, 1fx + s_ / 8fx)
	end)
end

function create_shield_booster(x,y,spawn_time,lifetime)
	local id = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/meshes/shield_booster.lua", 0)
	pewpew.customizable_entity_start_spawning(id, spawn_time)
	
	table.insert(bonuses, {
		id = id, type = "shield_booster", lifetime = lifetime * 30,
		dx = fmath.random_fixedpoint(-1fx, 1fx),
		dy = fmath.random_fixedpoint(-1fx, 1fx)
	})
	
	local s = 0fx
	pewpew.entity_set_update_callback(id, function()
		pewpew.customizable_entity_add_rotation_to_mesh(id, 0.089fx, 3fx, 7fx, 5fx)
		s = s + 0.219fx
		local s_ = sin_fx(s)
		pewpew.customizable_entity_set_mesh_scale(id, 1fx + s_ / 8fx)
	end)
end

function create_health_container(x,y,spawn_time,lifetime)
	local id = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/meshes/health_container.lua", 0)
	pewpew.customizable_entity_start_spawning(id, spawn_time)
	
	table.insert(bonuses, {
		id = id, type = "health_container", lifetime = lifetime * 30,
		dx = fmath.random_fixedpoint(-1fx, 1fx),
		dy = fmath.random_fixedpoint(-1fx, 1fx)
	})
	
	local s = 0fx
	pewpew.entity_set_update_callback(id, function()
		pewpew.customizable_entity_add_rotation_to_mesh(id, 0.089fx, 3fx, 7fx, 5fx)
		s = s + 0.219fx
		local s_ = sin_fx(s)
		pewpew.customizable_entity_set_mesh_scale(id, 1fx + s_ / 8fx)
	end)
end

function update_bonuses()
	local to_remove = {}
	for i = 1, #bonuses do
		if if_dead(ship_id) then
			table.insert(to_remove,i)
			break
		end
		if pewpew.entity_get_is_alive(bonuses[i].id) then
			bonuses[i].lifetime = bonuses[i].lifetime - 1
			if bonuses[i].lifetime <= 0 then
				pewpew.customizable_entity_start_exploding(bonuses[i].id, 40)
				table.insert(to_remove, i)
			end
			local x, y = pewpew.entity_get_position(bonuses[i].id)
			if x + bonuses[i].dx >= 2400fx or x + bonuses[i].dx <= 0fx then bonuses[i].dx = -bonuses[i].dx end
			if y + bonuses[i].dy >= 1600fx or y + bonuses[i].dy <= 0fx then bonuses[i].dy = -bonuses[i].dy end
			pewpew.entity_set_position(bonuses[i].id, x + bonuses[i].dx, y + bonuses[i].dy)
			local px, py = pewpew.entity_get_position(ship_id)
			if count_lenght(px, py, x, y) <= 20fx then
				if bonuses[i].type == "shield_booster" then
					add_shield(1)
					create_message(x, y + 50fx, "+Shield", 0xd3c121ff, 5)
				elseif generator.state == "alive" then
					if bonuses[i].type == "power_cell" then
						increase_timer(generator.timer, bonuses[i].time)
						create_message(x, y + 50fx, "+Power", 0x9f9f5fff, 5)
					else
						generator.health = generator.health + 5 + waves.wave
						create_message(x, y + 50fx, "+Health", 0x21d141ff, 5)
					end
				end
				pewpew.customizable_entity_start_exploding(bonuses[i].id, 40)
				table.insert(to_remove, i)
			end
		else table.insert(to_remove, i) end
	end
	for i = #to_remove, 1, -1 do table.remove(bonuses, to_remove[i]) end
end
