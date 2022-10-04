function movement1(id1,x0,y0,a)
local ang1,m1,no1,no2=pewpew.get_player_inputs(0)
if m1~=0fx then
local sin1,cos1=fmath.sincos(ang1)
local rx1,ry1
local s1=m1*a
rx1=x0+s1*cos1
ry1=y0+s1*sin1
pewpew.entity_set_position(id1,rx1,ry1)
return rx1,ry1
else
pewpew.entity_set_position(id1,x0,y0)
return x0,y0
end
end

function r_close(px,py,id1,r)
local x0,y0=pewpew.entity_get_position(id1)
local x1=fmath.abs_fixedpoint(px-x0)
local y1=fmath.abs_fixedpoint(py-y0)
if x1*x1+y1*y1<r*r then return true
else return false end
end

function r_close2(px,py,x,y,r)
local x1=fmath.abs_fixedpoint(px-x)
local y1=fmath.abs_fixedpoint(py-y)
if x1*x1+y1*y1<r*r then return true else return false end
end

function orbit_moving(id,ang,px,py,r,mod)
if not pewpew.entity_get_is_started_to_be_destroyed(id) then
local x,y=pewpew.entity_get_position(id)
ang=ang+fmath.tau()/mod
pewpew.customizable_entity_set_mesh_angle(id,ang+fmath.tau()/4fx,0fx,0fx,1fx)
local sin1,cos1=fmath.sincos(ang)
pewpew.entity_set_position(id,px+cos1*r,py+sin1*r)
end
return ang
end

function orbit_moving2(id,ang,px,py,r,mod)
if not pewpew.entity_get_is_started_to_be_destroyed(id) then
local x,y=pewpew.entity_get_position(id)
ang=ang+fmath.tau()/mod
local sin1,cos1=fmath.sincos(ang)
pewpew.entity_set_position(id,px+cos1*r,py+sin1*r)
end
return ang
end

function orbit_moving3(id,ang,px,py,r,mod)
if not pewpew.entity_get_is_started_to_be_destroyed(id) then
local x,y=pewpew.entity_get_position(id)
ang=ang+fmath.tau()/mod
local sin1,cos1=fmath.sincos(ang)
pewpew.entity_set_position(id,px+sin1*r*sin1*cos1,py+cos1*r*sin1*cos1)
end
return ang
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