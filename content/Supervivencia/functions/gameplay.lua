	
	require("/dynamic/functions/math.lua")
	require("/dynamic/functions/basics.lua")
	
	timers = {}
	
function create_timer(x,y,value, color)
	local id=pewpew.new_customizable_entity(x,y)
	table.insert(timers, {id = id, time = value * 30, color = color})
	return id
end

function find_timer(id)
	local index
	for i = 1, #timers do
		if timers[i].id == id then
			index = i
			break
		end
	end
	if index == nil then pewpew.print("timer error") else
	return index end
end

function increase_timer(id, value)
	local i = find_timer(id)
	timers[i].time = timers[i].time + value
end

function update_timers()
	local to_remove = {}
	for i = 1, #timers do
		if pewpew.entity_get_is_alive(timers[i].id) and not pewpew.entity_get_is_started_to_be_destroyed(timers[i].id) then
			if timers[i].time > 0 then
				timers[i].time = timers[i].time - 1
				local s = timers[i].time // 30 % 60
				local m = (timers[i].time - s) // 30 // 60
				local color_s = color_to_string(timers[i].color)
				if s < 10 then
				pewpew.customizable_entity_set_string(timers[i].id,color_s..m..":0"..s)
				else
				pewpew.customizable_entity_set_string(timers[i].id,color_s..m..":"..s)
				end
			end
		else table.insert(to_remove, i) end
	end
	for i = #to_remove, 1, -1 do table.remove(timers, to_remove[i]) end
end
