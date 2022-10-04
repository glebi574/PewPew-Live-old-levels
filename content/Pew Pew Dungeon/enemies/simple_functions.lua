function create_bullet_arrow(ship_id,px,py,x,y)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/simple_bullets.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
local dx=px-x
local dy=py-y
local ang=fmath.tau()/4fx-fmath.atan2(dx,dy)
local sin1,cos1=fmath.sincos(ang)
dx=cos1*10fx
dy=sin1*10fx
pewpew.customizable_entity_set_mesh_angle(id,ang,0fx,0fx,1fx)
pewpew.play_ambient_sound("/dynamic/sounds/other.lua",1)
local bullet={id,dx,dy,100}
return bullet
end

function simple_bullets_moving(simple_bullets_arr,ship_id,px,py)
if #simple_bullets_arr~=0 then
local numbers={}
local if_this_bullet=false
for i=1,#simple_bullets_arr do
if pewpew.entity_get_is_alive(simple_bullets_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(simple_bullets_arr[i][1]) then
local x,y=pewpew.entity_get_position(simple_bullets_arr[i][1])
local rx=x+simple_bullets_arr[i][2]
local ry=y+simple_bullets_arr[i][3]
pewpew.entity_set_position(simple_bullets_arr[i][1],rx,ry)
simple_bullets_arr[i][4]=simple_bullets_arr[i][4]-1
if simple_bullets_arr[i][4]<=0 then
pewpew.customizable_entity_start_exploding(simple_bullets_arr[i][1],20)
pewpew.create_explosion(x,y,0xff0000ff,1fx/2fx,8)
table.insert(numbers,i)
if_this_bullet=true
end
if r_close2(px,py,x,y,30fx) then
pewpew.add_damage_to_player_ship(ship_id,1)
pewpew.customizable_entity_start_exploding(simple_bullets_arr[i][1],20)
pewpew.create_explosion(x,y,0xff0000ff,1fx/2fx,8)
if not if_this_bullet then
table.insert(numbers,i)
end
end
if_this_bullet=false
end
end
for n=#numbers,1,-1 do
table.remove(simple_bullets_arr,numbers[n])
end
end
return simple_bullets_arr
end