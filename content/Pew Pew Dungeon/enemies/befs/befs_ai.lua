function create_bef1(x,y,dx,dy)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/befs/bef.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
local ang=fmath.tau()/4fx-fmath.atan2(dx,dy)
pewpew.customizable_entity_set_mesh_angle(id,ang,0fx,0fx,1fx)
local bef={id,dx,dy}
return bef
end

function ai_bef1(px,py,ship_id,zone,befs_arr)
if #befs_arr~=0 then
local no1,no2
local numbers={}
for i=1,#befs_arr do
if pewpew.entity_get_is_alive(befs_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(befs_arr[i][1]) then
pewpew.customizable_entity_add_rotation_to_mesh(befs_arr[i][1],fmath.tau()/20fx,befs_arr[i][2],befs_arr[i][3],0fx)
local x,y=pewpew.entity_get_position(befs_arr[i][1])
local rx=x+befs_arr[i][2]
local ry=y+befs_arr[i][3]
rx,no2=zones_local(rx,y,x,y,zone)
if rx==x then
befs_arr[i][2]=-1fx*befs_arr[i][2]
pewpew.customizable_entity_set_mesh_angle(befs_arr[i][1],fmath.tau()/4fx-fmath.atan2(befs_arr[i][2],befs_arr[i][3]),0fx,0fx,1fx)
end
no1,ry=zones_local(x,ry,x,y,zone)
if ry==y then
befs_arr[i][3]=-1fx*befs_arr[i][3]
pewpew.customizable_entity_set_mesh_angle(befs_arr[i][1],fmath.tau()/4fx-fmath.atan2(befs_arr[i][2],befs_arr[i][3]),0fx,0fx,1fx)
end
pewpew.entity_set_position(befs_arr[i][1],rx,ry)
if r_close2(px,py,rx,ry,20fx) then
pewpew.customizable_entity_start_exploding(befs_arr[i][1],50)
table.insert(numbers,i)
pewpew.increase_score_of_player(0,10)
pewpew.add_damage_to_player_ship(ship_id,1)
end
end
end
for n=#numbers,1,-1 do
table.remove(befs_arr,numbers[n])
end
end
return befs_arr
end