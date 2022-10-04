
function r_close(id,entity_id,r)
local px,py=pewpew.entity_get_position(id)
local ex,ey=pewpew.entity_get_position(entity_id)
local dx=fmath.abs_fixedpoint(px-ex)
local dy=fmath.abs_fixedpoint(py-ey)
if dx*dx+dy*dy<r*r then return true
else return false end
end

function r_close_coords(id,x,y,r)
local px,py=pewpew.entity_get_position(id)
local dx=fmath.abs_fixedpoint(px-x)
local dy=fmath.abs_fixedpoint(py-y)
if dx*dx+dy*dy<r*r then return true
else return false end
end

function r_close_all_coords(x1,y1,x2,y2,r)
local dx=fmath.abs_fixedpoint(x1-x2)
local dy=fmath.abs_fixedpoint(y1-y2)
if dx*dx+dy*dy<r*r then return true
else return false end
end

function make_color(r, g, b, a)
  local color = r * 256 + g
  color = color * 256 + b
  color = color * 256 + a
  return color
end

function make_color_with_alpha(color, new_alpha)
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

function floating_message(x, y, text, scale, color, d_alpha)
  local id = pewpew.new_customizable_entity(x, y)
  local z = 0fx
  local alpha = 255
  pewpew.customizable_entity_set_mesh_scale(id, scale)


  pewpew.entity_set_update_callback(id, function()
    z = z + 20fx
    local color = make_color_with_alpha(color, alpha)
    local color_s = color_to_string(color)
    pewpew.customizable_entity_set_string(id, color_s .. text)
    pewpew.customizable_entity_set_mesh_z(id, z)
    alpha = alpha - d_alpha
    if alpha <= 0 then
      pewpew.entity_destroy(id)
    end
  end)
  return id
end