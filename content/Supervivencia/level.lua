	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	require("/dynamic/functions/particles.lua")
	require("/dynamic/functions/enemies.lua")
	require("/dynamic/functions/bullets.lua")
	require("/dynamic/functions/gameplay.lua")
	require("/dynamic/functions/power_ups.lua")
	require("/dynamic/functions/generator_.lua")
	
	local walls = pewpew.new_customizable_entity(0fx, 0fx)
	pewpew.customizable_entity_set_mesh(walls, "/dynamic/meshes/bg/levelborders.lua", 0)
	local bg = pewpew.new_customizable_entity(1200fx, 800fx)
	pewpew.customizable_entity_set_mesh(bg, "/dynamic/meshes/bg/bg.lua", 0)

	pewpew.set_level_size(2400fx, 1600fx)
	ship_id = pewpew.new_player_ship(1200fx, 1000fx, 0)
	pewpew.configure_player(0, {camera_distance = -200fx, shield = 6})

	local time = 0
	local death = false
	
	pewpew.add_update_callback(update_timers)
	pewpew.add_update_callback(update_bonuses)
	pewpew.add_update_callback(update_generator)
	pewpew.add_update_callback(pb_engine)
	pewpew.add_update_callback(enemies_check)
	
	pewpew.add_update_callback(update_particle_points)
	pewpew.add_update_callback(update_following_entities_info)
	pewpew.add_update_callback(particles_engine)
	
	create_particle_point(201, ship_id, "random",
	{a1 = 700fx, a2 = 0fx, type = "square", p = 64, condition = "chance"}, {v = 63fx, r = 11fx}, {"square","dot"},
	{dx = 2fx, dy = 2fx, r = 2fx, type = "rotation"}, {ds = 0fx, rs_type = "null", da = 0fx, r_type = "null"})
	
	generator.id1 = pewpew.new_customizable_entity(1200fx, 800fx)
	pewpew.customizable_entity_set_mesh(generator.id1, "/dynamic/meshes/meshes/generator.lua", 0)
	generator.id2 = pewpew.new_customizable_entity(1200fx, 800fx)
	pewpew.customizable_entity_set_mesh(generator.id2, "/dynamic/meshes/meshes/generator.lua", 1)
	generator.timer = create_timer(1200fx, 860fx, 60, 0xa1c121a1)
	generator.info1 = pewpew.new_customizable_entity(1200fx, 740fx)
	generator.info2 = pewpew.new_customizable_entity(1200fx, 710fx)
	
	create_particle_point(201, generator.id1, 0xffffffa1,
	{a1 = 200fx, a2 = 0fx, type = "circle", p = 7, condition = "chance"}, {v = 63fx, r = 11fx}, {"square","dot"},
	{dx = 2fx, dy = 2fx, r = 2fx, type = "rotation"}, {ds = 0fx, rs_type = "null", da = 0fx, r_type = "null"})
	
	pewpew.entity_set_update_callback(generator.id1, function()
	pewpew.customizable_entity_add_rotation_to_mesh(generator.id1, 0.089fx, 2fx, 8fx, 0fx) end)
	pewpew.entity_set_update_callback(generator.id2, function()
	pewpew.customizable_entity_add_rotation_to_mesh(generator.id2, 0.089fx, 2fx, -8fx, -3fx) end)
	pewpew.entity_set_update_callback(generator.info1, function()
	pewpew.customizable_entity_set_string(generator.info1, "#f19921a1Progress:".. (generator.progress * 0.055) // 1 .."%") end)
	pewpew.entity_set_update_callback(generator.info2, function()
	pewpew.customizable_entity_set_string(generator.info2, "#21d141a1Health:".. generator.health) end)
	--"#21d141a1Health:".. generator.health .. "/".. generator.max_health
	
	create_message(1200fx, 970fx, "Collect power cells to keep generator powered", 0xf1f121ff, 1)
	create_message(1200fx, 940fx, "and protect it", 0xf1a121ff, 1)
	create_message(1200fx, 910fx, "Every minute it produces shield and health", 0x41f1a1ff, 1)
	--create_message(1200fx, 640fx, "Will add perks later :)", 0x91f121ff, 2)
	
	create_power_cell(1000fx, 800fx, 20, 60, 120)
	create_shield_booster(1400fx, 800fx, 60, 120)
	create_health_container(1200fx, 900fx, 60, 120)
	
	local tb = {
		{
			{wasp = 0.5, rocket_ship = 16, healer = -1, tank = -1, mothership = -1, boss = -1},
			{wasp = 0.5, rocket_ship = 16, healer = 30, tank = -1, mothership = -1, boss = -1},
			{wasp = 0.5, rocket_ship = 16, healer = 40, tank = 30, mothership = -1, boss = -1}
		},
		{
			{wasp = 1, rocket_ship = 7, healer = 40, tank = 30, mothership = -1, boss = -1},
			{wasp = 1, rocket_ship = 7, healer = 40, tank = 30, mothership = -1, boss = -1},
			{wasp = 1, rocket_ship = 7, healer = 40, tank = 30, mothership = 30, boss = -1}
		},
		{
			{wasp = 2, rocket_ship = 8, healer = 40, tank = 48, mothership = 32, boss = -1},
			{wasp = 2, rocket_ship = 8, healer = 40, tank = 48, mothership = 40, boss = 60},
			{wasp = 2, rocket_ship = 8, healer = 40, tank = 48, mothership = 48, boss = 50}
		},
		{
			{wasp = 2.5, rocket_ship = 8, healer = 48, tank = 48, mothership = 48, boss = 48},
			{wasp = 2.5, rocket_ship = 8, healer = 60, tank = 48, mothership = 48, boss = 48},
			{wasp = 2.5, rocket_ship = 8, healer = 60, tank = 48, mothership = 48, boss = 48}
		},
		{
			{wasp = 3, rocket_ship = 7, healer = 60, tank = 40, mothership = 48, boss = 40},
			{wasp = 3, rocket_ship = 7, healer = 60, tank = 40, mothership = 40, boss = 32},
			{wasp = 3, rocket_ship = 7, healer = 60, tank = 40, mothership = 32, boss = 24}
		}
	}
	
function spawn_enemies()
	local t1, t2 = waves.tier, waves.tier
	if waves.tier >= 3 then t1 = 3 end
	if waves.tier >= 2 then t2 = 2 end
	local w, w_ = waves.wave, waves.wave_
	if w >= 6 then w = 5 w_ = 3 end
	local x
	if chance(50) then x = fmath.random_fixedpoint(200fx, 1050fx)
	else x = fmath.random_fixedpoint(1350fx, 2200fx) end
	local y = fmath.random_fixedpoint(200fx, 1400fx)
	if time % (tb[w][w_].wasp * 30) == 0 then create_enemy(x,y,"wasp",t1) end
	if time % (tb[w][w_].rocket_ship * 30) == 0 then create_enemy(x,y,"rocket_ship",t2) end
	if tb[w][w_].healer ~= -1 then if time % (tb[w][w_].healer * 30) == 0 then create_enemy(x,y,"healer",t2) end end
	if tb[w][w_].tank ~= -1 then if time % (tb[w][w_].tank * 30) == 0 then create_enemy(x,y,"tank",t2) end end
	if tb[w][w_].mothership ~= -1 then if time % (tb[w][w_].mothership * 30) == 0 then create_enemy(x,y,"mothership",1) end end
	if tb[w][w_].boss ~= -1 then if time % (tb[w][w_].boss * 30) == 0 then create_enemy(x,y,"boss",1) end end
end

function level_tick()
	local conf = pewpew.get_player_configuration(0)
	if conf["has_lost"] == true then
		pewpew.stop_game()
		death = true
	end
	if not death then
		time = time + 1
		--if time % 30 == 0 then pewpew.print(pewpew.get_entity_count(pewpew.EntityType.CUSTOMIZABLE_ENTITY)) end
		if time % 1800 == 0 then
			waves.wave_ = waves.wave_ + 1
			if waves.wave_ >= 3 then waves.wave = waves.wave + 1 waves.wave_ = 1 end
			waves.p_health = waves.p_health + 0.1
			waves.p_damage = waves.p_damage + 0.1
			pb_damage = pb_damage + 0.1
		end
		if time % 7200 == 0 then waves.tier = waves.tier + 1 end
		if time == 7200 then pbf = 3 end
		
	end
end

pewpew.add_update_callback(level_tick)
pewpew.add_update_callback(spawn_enemies)