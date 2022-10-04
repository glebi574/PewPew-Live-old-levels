	
	require("/dynamic/functions/math.lua")
	
	boxes = {}

function add_shield(n)
	local s = pewpew.get_player_configuration(0).shield
	pewpew.configure_player(0, {shield = s + n})
end

function if_dead(id)
	if pewpew.entity_get_is_alive(id) and not pewpew.entity_get_is_started_to_be_destroyed(id) then return false end
	return true
end

function make_color(r, g, b, a)
  local color = r * 256 + g
  color = color * 256 + b
  color = color * 256 + a
  return color
end

function change_alpha(color, new_alpha)
  local alpha = color % 256
  color = color - alpha + new_alpha
  return color
end

function color_to_string(color)
	local s = string.format("%x", color)
	while string.len(s) < 8 do
		s = "0" .. s
	end
	return "#" .. s
end

function destroy_text(id, text, color, d_alpha)
	local alpha = 255
	pewpew.entity_set_update_callback(id, function()
	local color = change_alpha(color, alpha)
	local color_s = color_to_string(color)
	pewpew.customizable_entity_set_string(id, color_s .. text)
	alpha = alpha - d_alpha
	if alpha <= 0 then pewpew.entity_destroy(id) end
	end)
end

function create_message(x, y, text, color, d_alpha)
	local id = pewpew.new_customizable_entity(x, y)
	destroy_text(id, text, color, d_alpha)
	return id
end
--[[
function create_text_box(x,y,sx,sy,sz,text,index)
	local id1 = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id1, "/dynamic/meshes/meshes/box.lua", 0)
	pewpew.customizable_entity_set_mesh_xyz_scale(id1, sx, sy, sz)
	local id2 = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_string(id2, text)
	table.insert(boxes, {
		box = id1, content = id2, index = index, type = "text",
		x1 = x - sx, x2 = x + sx,
		y1 = y - sy, y2 = y + sy
	})
end

function create_mesh_box(x,y,sx,sy,sz,way,index)
	local id1 = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id1, "/dynamic/meshes/meshes/box.lua", 0)
	pewpew.customizable_entity_set_mesh_xyz_scale(id1, sx, sy, sz)
	local id2 = pewpew.new_customizable_entity(x, y)
	pewpew.customizable_entity_set_mesh(id2, way, 0)
	table.insert(boxes, {
		box = id1, content = id2, index = index, type = "mesh",
		x1 = x - sx, x2 = x + sx,
		y1 = y - sy, y2 = y + sy
	})
end

function find_box(index)
	for i = 1, #boxes do if boxes[i].index == index then return i end end
	return 1
end

function check_box_collision(index, id)
	local i = find_box(index)
	local x, y = pewpew.entity_get_position(id)
	if x >= boxes[i].x1 and x <= boxes[i].x2 and y >= boxes[i].y1 and y <= boxes[i].y2 then return true end
	return false
end

function destroy_box(index, time)
	local i = find_box(index)
	pewpew.customizable_entity_start_exploding(boxes[i].box, time)
	if boxes[i].type == "text" then pewpew.entity_destroy(boxes[i].content)
	else pewpew.customizable_entity_start_exploding(boxes[i].content, time) end
end
]]--
