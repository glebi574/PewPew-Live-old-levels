	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	
	local frequency = 0
	player_bullets = {}
	pb_damage = 1
	pbf = 4
	
--[[
	
	bullets:
	-arrow
	-rocket
	-big_shard
	-shard
	-crystal
	
	parametres:
	-damage
	-id
	-mesh {text, n}
	-hitbox's radius
	-lifetime
	--movement {dx, dy, max_speed}
	--modifiers {"", "", ""}
		-ricochet (r_chance)
		-homing (h_id, h_ratio)
		-material
		-break_to_shards(s_num)
	
]]--

--[[
	
	player's bullets:
	-id
	
]]--
	
	wx1 = 0fx
	wy1 = 0fx
	wx2 = 2400fx
	wy2 = 1600fx
	
function pb_engine()
	if not if_dead(ship_id) then
		if frequency <= 29 then frequency = frequency + 1 end
		local ang, a, s_ang, s_a = pewpew.get_player_inputs(0)
		local x, y = pewpew.entity_get_position(ship_id)
		local id
		if s_a ~= 0fx and frequency >= pbf then
			frequency = frequency - pbf
			id = pewpew.new_player_bullet(x, y, s_ang, 0)
			table.insert(player_bullets, id)
		end
		
		local to_remove = {}
		for i = 1, #player_bullets do
			if not pewpew.entity_get_is_alive(player_bullets[i]) then table.insert(to_remove, i) end
		end
		for i = #to_remove, 1, -1 do table.remove(player_bullets, to_remove[i]) end
	end
end

local function destroy_bullet(id,x,y)
	pewpew.customizable_entity_start_exploding(id, 20)
	pewpew.create_explosion(x,y,0xffffff7a,0.2112fx,5)
end

local function ricochet(x,y,movement,modifiers)
	if chance(modifiers.r_chance) then
		if x < wx1 + 3fx or x > wx2 - 3fx then movement.dx = -movement.dx end
		if y < wy1 + 3fx or y > wy2 - 3fx then movement.dy = -movement.dy end
	end
end
local function homing(x,y,movement,modifiers)
	local x_, y_ = pewpew.entity_get_position(modifiers.h_id)
	local d = count_lenght(x, y, x_, y_)
	x_ = (x_ - x) / d * modifiers.h_ratio
	y_ = (y_ - y) / d * modifiers.h_ratio
	movement.dx = movement.dx + x_
	movement.dy = movement.dy + y_
end
local function material(id,x,y,hitbox,h)
	for i = 1, #player_bullets do
		if not pewpew.entity_get_is_started_to_be_destroyed(player_bullets[i]) then
			local bx, by = pewpew.entity_get_position(player_bullets[i])
			if count_lenght(x, y, bx, by) < hitbox then
				pewpew.entity_destroy(player_bullets[i])
				pewpew.create_explosion(bx,by,0xffffff71,0.1024fx,3)
				h.h = h.h - pb_damage
				break
			end
		end
	end
end
local function break_to_shards(x,y,modifiers,lifetime)
	local ang = fmath.tau() / fmath.to_fixedpoint(modifiers.s_num)
	local r_ang = fmath.random_fixedpoint(0fx, fmath.tau())
	for i = 0, modifiers.s_num - 1 do
		local dy, dx = fmath.sincos(ang * fmath.to_fixedpoint(i) + r_ang)
		create_bullet(x, y,{"shard",0},
		{dx = dx * 5fx, dy = dy * 5fx, max_speed = 8fx},
		{},14fx,4,1.1,0.1)
	end
end

function create_bullet(x,y,mesh,movement,modifiers,hitbox,lifetime,health,damage)
	local id = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/bullets/"..mesh[1]..".lua", mesh[2])
	pewpew.customizable_entity_start_spawning(id, 1)
	pewpew.customizable_entity_set_position_interpolation(id, true)
	lifetime = lifetime * 30
	
	local h = {h = health}
	
	pewpew.entity_set_update_callback(id, function()
		if if_dead(ship_id) then destroy_bullet(id,x,y) end
		pewpew.customizable_entity_set_mesh_angle(id, fmath.atan2(movement.dy, movement.dx), 0fx, 0fx, 1fx)
		x = x + movement.dx
		y = y + movement.dy
		movement.dx = movement.dx + fmath.random_fixedpoint(-movement.max_speed / 64fx, movement.max_speed / 64fx)
		movement.dy = movement.dy + fmath.random_fixedpoint(-movement.max_speed / 64fx, movement.max_speed / 64fx)
		pewpew.entity_set_position(id, x, y)
		if not if_dead(id) then
			for i = 1, #modifiers do
				if modifiers[i] == "ricochet" then ricochet(x,y,movement,modifiers)
				elseif modifiers[i] == "homing" then homing(x,y,movement,modifiers)
				elseif modifiers[i] == "material" then material(id,x,y,hitbox,h)
				elseif modifiers[i] == "break_to_shards" then if lifetime <= 1 then break_to_shards(x,y,modifiers,lifetime) end end
			end
			lifetime = lifetime - 1
			if lifetime <= 0 or x <= wx1 or x >= wx2 or y <= wy1 or y >= wy2 then
				destroy_bullet(id,x,y)
			end
			local px, py = pewpew.entity_get_position(ship_id)
			if count_lenght(x, y, px, py) < 18fx then
				if pewpew.get_player_configuration(0).shield == 0 then
					pewpew.entity_set_position(ship_id, wx2 / 2fx, wy2 / 2fx)
					pewpew.configure_player(0, {camera_distance = -2000fx})
				end
				pewpew.add_damage_to_player_ship(ship_id,1)
				destroy_bullet(id,x,y)
			end
			if generator.state == "alive" then
				local gx, gy = pewpew.entity_get_position(generator.id1)
				if count_lenght(x, y, gx, gy) < 26fx then
					generator.health = generator.health - damage
					destroy_bullet(id,x,y)
				end
			end
			if h.h <= 0 then destroy_bullet(id,x,y) end
			if mesh[1] ~= "crystal" then
				if pewpew.get_entity_count(pewpew.EntityType.CUSTOMIZABLE_ENTITY) >= 450 then
				if chance(30) then destroy_bullet(id,x,y) end
				elseif chance(1) then destroy_bullet(id,x,y) end
			end
		end
		if count_lenght(movement.dx, movement.dy, 0fx, 0fx) > movement.max_speed then
			movement.dx = movement.dx * 0.3685fx
			movement.dy = movement.dy * 0.3685fx
		end
	end)
end
