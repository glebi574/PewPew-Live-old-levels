	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	require("/dynamic/functions/particles.lua")
	require("/dynamic/functions/power_ups.lua")
	
	healers = {}
	waves = {
		wave = 1,
		wave_ = 1,
		p_health = 0,
		p_damage = 0,
		tier = 1
	}
	
--[[
	
	AI types:
	-follower
	-spectator
	-stalker
	-search_for_help
	
	AI aim type:
	-generator
	-player
	-any
	-null
	
	
	enemy parametres:
	-id
	-dx
	-dy
	-max_speed
	-health
	-modifier
	-hitbox's radius
	-type
	-tier
	
	
	modifiers:
	-shield(s_chance,s_r)
	
]]--

function enemies_check()
	local to_remove = {}
	for i = 1, #healers do if if_dead(healers[i]) then table.insert(to_remove, i) end end
	for i = #to_remove, 1, -1 do table.remove(healers, to_remove[i]) end
end

local function set_values(type, tier, values)
	local k
	if type == "wasp" then k = 1
	elseif type == "healer" then k = 2
	elseif type == "rocket_ship" then k = 3
	elseif type == "tank" then k = 4
	elseif type == "mothership" then k = 5
	elseif type == "boss" then k = 6
	end
	local v = values[k][tier]
	return v
end

local function ai(ai_type, ai_aim_type, stage, x, y, dx, dy, max_speed)
	local px, py
	if ai_aim_type == "player" then px, py = pewpew.entity_get_position(ship_id)
	elseif ai_aim_type == "generator" then px, py = pewpew.entity_get_position(generator.id1)
	end
	
	if ai_type == "follower" then
		local d = count_lenght(x, y, px, py)
		dx = dx + (px - x) / d / 6fx
		dy = dy + (py - y) / d / 6fx
	elseif ai_type == "stalker" then
		local d = count_lenght(x, y, px, py)
		if d <= 150fx then stage = 1 else stage = 0 end
		local k = 1fx
		if stage == 1 then k = 0.2064fx end
		dx = (dx + (px - x) / d / 6fx) * k
		dy = (dy + (py - y) / d / 6fx) * k
	elseif ai_type == "spectator" then
		if stage <= 1 then
			local mx, my, sp
			if x <= wx2 / 2fx and y <= wy2 / 2fx then sp = 1
			elseif x > wx2 / 2fx and y <= wy2 / 2fx then sp = 2
			elseif x > wx2 / 2fx and y > wy2 / 2fx then sp = 3
			elseif x <= wy2 / 2fx and y > wy2 / 2fx then sp = 4
			end
			if sp == 4 then mx = fmath.random_fixedpoint(200fx, 550fx) my = fmath.random_fixedpoint(200fx, 550fx)
			elseif sp == 1 then mx = fmath.random_fixedpoint(1850fx, 2200fx) my = fmath.random_fixedpoint(200fx, 550fx)
			elseif sp == 2 then mx = fmath.random_fixedpoint(1850fx, 2200fx) my = fmath.random_fixedpoint(1050fx, 1400fx)
			else mx = fmath.random_fixedpoint(200fx, 550fx) my = fmath.random_fixedpoint(1050fx, 1400fx)
			end
			local d = count_lenght(x, y, mx, my)
			stage = 2
			dx = (mx - x) / d * max_speed
			dy = (my - y) / d * max_speed
		end
	elseif ai_type == "search_for_help" then
		if #healers ~= 0 then
			local hx, hy = pewpew.entity_get_position(healers[1])
			local d = count_lenght(x, y, hx, hy)
			if d <= 110fx then stage = 1 else stage = 0 end
			local k = 1fx
			if stage == 1 then k = 0.2064fx end
			dx = (dx + (hx - x) / d / 6fx) * k
			dy = (dy + (hy - y) / d / 6fx) * k
		else
			local d = count_lenght(x, y, px, py)
			if d <= 200fx then stage = 1 else stage = 0 end
			local k = 1fx
			if stage == 1 then k = 0.2064fx end
			dx = (dx + (px - x) / d / 6fx) * k
			dy = (dy + (py - y) / d / 6fx) * k
		end
	end
	return stage, dx, dy
end

local function b_shield(x, y, modifiers)
	for i = 1, #player_bullets do
		if not if_dead(player_bullets[i]) then
			local bx, by = pewpew.entity_get_position(player_bullets[i])
			if count_lenght(x, y, bx, by) < modifiers.s_r and chance(modifiers.s_chance) then
				pewpew.entity_destroy(player_bullets[i])
				pewpew.create_explosion(bx,by,0xffffff71,0.1024fx,3)
				break
			end
		end
	end
end

local function pb_collision(x, y, hitbox, health)
	for i = 1, #player_bullets do
		if not if_dead(player_bullets[i]) then
			local bx, by = pewpew.entity_get_position(player_bullets[i])
			if count_lenght(x, y, bx, by) < hitbox then
				pewpew.entity_destroy(player_bullets[i])
				pewpew.create_explosion(bx,by,0xffffff71,0.1024fx,3)
				health = health - pb_damage
				break
			end
		end
	end
	return health
end

local function weapon(x, y, type, ai_aim_type, tier, w_timers)
	for i = 1, #w_timers do w_timers[i] = w_timers[i] + 1 end
	local rdx = fmath.random_fixedpoint(0.512fx, 2fx)
	local rdy = fmath.random_fixedpoint(0.512fx, 2fx)
	
	local px, py, h_id
	if ai_aim_type == "player" then px, py = pewpew.entity_get_position(ship_id) h_id = ship_id
	elseif ai_aim_type == "generator" then px, py = pewpew.entity_get_position(generator.id1) h_id = generator.id1
	end
	
	local d = count_lenght(x, y, px, py)
	local dx = (px - x) / d * 2fx
	local dy = (py - y) / d * 2fx
	local dx_fast = dx * (fmath.to_fixedpoint(waves.wave) * rdx) * 2fx
	local dy_fast = dy * (fmath.to_fixedpoint(waves.wave) * rdy) * 2fx
	local max_speed_fast = 10fx + fmath.to_fixedpoint(waves.wave)
	
	if type == "wasp" then
		if w_timers[1] % 48 == 0 then
			create_bullet(x, y,{"arrow", tier - 1},
			{dx = dx_fast, dy = dy_fast, max_speed = max_speed_fast},
			{"ricochet", r_chance = 13 * tier * 0.7},16fx,4,0.8 * tier,0.1 + waves.p_damage)
		end
	elseif type == "rocket_ship" then
		w_timers[2] = w_timers[2] - 1
		if w_timers[1] % 48 == 0 then
			w_timers[2] = 1
		end
		if w_timers[2] >= 1 then
			w_timers[2] = w_timers[2] + 1
			if w_timers[2] % 6 == 0 then
				create_bullet(x, y,{"rocket", tier - 1},
				{dx = dx, dy = dy, max_speed = 4fx + fmath.to_fixedpoint(waves.wave)},
				{"material", "homing", h_id = h_id, h_ratio = 0.512fx * fmath.to_fixedpoint(tier), "ricochet", r_chance = 13 * tier * 0.4},
				18fx, 2 + 4 + tier * 2, 1.1 * tier, 0.3 + waves.p_damage)
			end
			if w_timers[2] >= 19 + (waves.wave - 2) * 6 then w_timers[2] = 0 end
		end
	elseif type == "tank" then
		if w_timers[1] % 40 == 0 then
			create_bullet(x, y,{"big_shard", 0},
			{dx = dx_fast, dy = dy_fast, max_speed = max_speed_fast},
			{"ricochet", r_chance = 9},12fx,4,2.5,0.2 + waves.p_damage)
		end
		if w_timers[1] % 60 == 0 then
			create_bullet(x, y,{"crystal", 0},
			{dx = dx * 2fx, dy = dy * 2fx, max_speed = 4fx},
			{"material", "break_to_shards", s_num = fmath.random_int(3, 6)},
			26fx, 3, 23, 1.2 + waves.p_damage)
		end
	elseif type == "boss" then
		w_timers[2] = w_timers[2] - 1
		if w_timers[1] % 40 == 0 then
			w_timers[2] = 1
		end
		if w_timers[2] >= 1 then
			w_timers[2] = w_timers[2] + 1
			if w_timers[2] % 2 == 0 then
				create_bullet(x, y,{"shard", 0},
				{dx = dx_fast, dy = dy_fast, max_speed = max_speed_fast},
				{},12fx,5,1.8,0.3 + waves.p_damage)
			end
			if w_timers[2] >= 19 then w_timers[2] = 0 end
		end
		if w_timers[1] % 80 == 0 then
			create_bullet(x, y,{"crystal", 0},
			{dx = dx * 2fx, dy = dy * 2fx, max_speed = 4fx},
			{"material", "break_to_shards", s_num = fmath.random_int(6, 9)},
			26fx, 3, 23, 1.2 + waves.p_damage)
		end
	elseif type == "mothership" then
		if w_timers[1] % 120 == 0 then
			create_enemy(x, y, "wasp", fmath.random_int(1,2))
		end
		if w_timers[1] % 6 == 0 then
				create_bullet(x, y,{"shard", 0},
				{dx = dx_fast, dy = dy_fast, max_speed = max_speed_fast},
				{},12fx,3.5,1.8,0.3 + waves.p_damage)
			end
	end
end

function create_enemy(x,y,type,tier)
	local id = pewpew.new_customizable_entity(x,y)
	pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/enemies/"..type..".lua", tier - 1)
	pewpew.customizable_entity_start_spawning(id, 1)
	pewpew.customizable_entity_set_position_interpolation(id, true)
	
	local dx, dy = 0fx, 0fx
	local score = set_values(type, tier, {
		{40, 80, 160},
		{200, 360},
		{250, 500},
		{500, 750},
		{1000},
		{1400}
	})
	local health = set_values(type, tier, {
		{1.0, 1.7, 2.4},
		{18.9, 29.4},
		{6.7, 8.6},
		{25.1, 40.9},
		{73.4},
		{63.2}
	})
	health = health + waves.p_health
	local max_health = health
	local max_speed = set_values(type, tier, {
		{9fx, 8.2048fx, 8fx},
		{4fx, 4.2048fx},
		{5fx, 5fx},
		{3fx, 4fx},
		{2fx},
		{3fx}
	})
	local hitbox = set_values(type, tier, {
		{14fx, 16fx, 18fx},
		{34fx, 34fx},
		{24fx, 24fx},
		{27fx, 27fx},
		{62fx},
		{48fx}
	})
	local modifiers = {}
	if type == "healer" then
		modifiers = {
			"shield",
			s_chance = 3 * tier, s_r = 90fx * fmath.to_fixedpoint(tier)
		}
	elseif type == "mothership" then
		modifiers = {
			"shield",
			s_chance = 7, s_r = 200fx
		}
	end
	if #modifiers ~= 0 then
		create_particle_point(200, id, 0x43f121ff,
		{a1 = modifiers.s_r - 20fx, a2 = modifiers.s_r, type = "ring", p = 48, condition = "chance"}, {v = 31fx, r = 6fx}, {"dot"},
		{dx = 0fx, dy = 0fx, r = 0fx, type = "static"}, {ds = 0fx, rs_type = "null", da = 0fx, r_type = "abs_null"})
	end
	local ai_type = set_values(type, tier, {
		{"follower", "follower", "follower"},
		{"spectator", "spectator"},
		{"stalker", "stalker"},
		{"stalker", "stalker"},
		{"spectator"},
		{"stalker"}
	})
	local ai_aim_type = "player"
	if type == "wasp" and generator.state == "alive" then ai_aim_type = "generator" end
	if type == "healer" or type == "mothership" then table.insert(healers, id) end
	local stage = 0
	local w_timers = {0,0}
	
	pewpew.entity_set_update_callback(id, function()
		if generator.state ~= "alive" then ai_aim_type = "player" end
		if if_dead(ship_id) then ai_type = "spectator" ai_aim_type = "null" end
		pewpew.customizable_entity_set_mesh_angle(id, fmath.atan2(dy, dx), 0fx, 0fx, 1fx)
		x = x + dx * (1fx + fmath.random_fixedpoint(0fx, 0.2048fx))
		y = y + dy * (1fx + fmath.random_fixedpoint(0fx, 0.2048fx))
		pewpew.entity_set_position(id, x, y)
		if not if_dead(id) then
			stage, dx, dy = ai(ai_type, ai_aim_type, stage, x, y, dx, dy, max_speed)
			if type ~= "healer" and not if_dead(ship_id) then weapon(x, y, type, ai_aim_type, tier, w_timers) end
			health = pb_collision(x, y, hitbox, health)
			if #modifiers ~= 0 then b_shield(x, y, modifiers) end
			if type == "wasp" and health < max_health then ai_aim_type = "player" end
			if (type == "wasp" or type == "rocket_ship") and health < max_health * 0.5 then ai_type = "search_for_help" end
			
			if x < wx1 + 140fx then dx = dx + 0.512fx
			elseif x > wx2 - 140fx then dx = dx - 0.512fx
			elseif y < wy1 + 140fx then dy = dy + 0.512fx
			elseif y > wy2 - 140fx then dy = dy - 0.512fx
			end
			if count_lenght(dx, dy, 0fx, 0fx) > max_speed then
				dx = dx * 0.3685fx
				dy = dy * 0.3685fx
			end
			if health <= 0 then
				pewpew.customizable_entity_start_exploding(id, 46)
				pewpew.create_explosion(x, y, 0xffffff8a, 0.2112fx, 9)
				pewpew.increase_score_of_player(0, score)
				if generator.state == "alive" then
					if chance(3) then create_power_cell(x, y, 20, 30, 80)
					elseif chance(3) then create_shield_booster(x, y, 30, 80)
					elseif chance(3) then create_health_container(x, y, 30, 80)
					end
				else
					if chance(5) then create_shield_booster(x, y, 30, 80) end
				end
			end
			if pewpew.get_entity_count(pewpew.EntityType.CUSTOMIZABLE_ENTITY) >= 450 then
				if type == "wasp" or type == "rocket_ship" then if chance(30) then health = -1 end end
			end
		elseif type == "mothership" or type == "boss" then pewpew.create_explosion(x, y, 0xffffff8a, 0.2761fx, 3) end
	end)
end
