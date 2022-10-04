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

function control()
local no1,no2,ang1,k1=pewpew.get_player_inputs(0)
local d1
if k1~=0fx then
local rad1=360fx/fmath.tau()
local angr1=ang1*rad1
if (angr1>=0fx) and (angr1<180fx) then
d1=1
end
if (angr1>=180fx) and (angr1<360fx) then
d1=2
end
else d1=0
end
return d1
end

function r_close1(px,py,id1,r)
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

function box_activating(px,py,id)
if pewpew.entity_get_is_alive(id) and not pewpew.entity_get_is_started_to_be_destroyed(id) then if r_close1(px,py,id,75fx) then pewpew.customizable_entity_start_exploding(id,100) return true else return false end end
end

function box_parts(box_id,part_id)
if not pewpew.entity_get_is_alive(box_id) or pewpew.entity_get_is_started_to_be_destroyed(box_id) then if pewpew.entity_get_is_alive(part_id) then pewpew.customizable_entity_start_exploding(part_id,100) end end
end

function frames_system(frames,num,id,min_frame,max_frame,way)
if frames[num][2]==0 then
  pewpew.customizable_entity_set_flipping_meshes(id, way, frames[num][1],frames[num][1]+1)
  else
  pewpew.customizable_entity_set_flipping_meshes(id, way, frames[num][1]+1,frames[num][1])
end
  if frames[num][1]>max_frame then frames[num][2]=1 end
  if frames[num][1]<min_frame then frames[num][2]=0 end
  if frames[num][2]==0 then frames[num][1]=frames[num][1]+1 else frames[num][1]=frames[num][1]-1 end
return frames
end

function sphere_moving_vect(entity,pos)
local acceleration=100fx
local dx=(entity[2]-pos[1])
local dy=(entity[3]-pos[2])
local dz=(entity[4]-pos[3])
entity[5]=entity[5]+fmath.random_fixedpoint(-100fx,100fx)/100fx
entity[6]=entity[6]+fmath.random_fixedpoint(-100fx,100fx)/100fx
entity[7]=entity[7]+fmath.random_fixedpoint(-100fx,100fx)/100fx
entity[2]=entity[2]+entity[5]
entity[3]=entity[3]+entity[6]
entity[4]=entity[4]+entity[7]
pewpew.entity_set_position(entity[1],entity[2],entity[3])
pewpew.customizable_entity_set_mesh_z(entity[1],entity[4])
if fmath.abs_fixedpoint(dx)>1000fx or fmath.abs_fixedpoint(dy)>1000fx or fmath.abs_fixedpoint(dz)>1000fx then
entity[2]=pos[1]
entity[3]=pos[2]
entity[4]=pos[3]
end
return entity
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