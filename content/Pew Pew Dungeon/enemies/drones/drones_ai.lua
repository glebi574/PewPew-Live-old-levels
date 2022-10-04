function create_healing_drone(x,y)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/drones/healing_drone.lua",0)
pewpew.customizable_entity_set_mesh_angle(id,fmath.tau()/4fx,0fx,0fx,1fx)
pewpew.customizable_entity_set_position_interpolation(id,true)
local drone={id,5,true,0,fmath.tau()/4fx}
return drone
end

function create_attacker(x,y)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/drones/attacker.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
local drone={id,3,false,0,0fx,0fx,0}
return drone
end

function ai_attacker(px,py,ship_id,zone,drones_arr,simple_bullets_arr)
if #drones_arr~=0 then
local numbers={}
for i=1,#drones_arr do
if not drones_arr[i][3] then
if pewpew.entity_get_is_alive(drones_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(drones_arr[i][1]) then
local x,y=pewpew.entity_get_position(drones_arr[i][1])
drones_arr[i][4]=drones_arr[i][4]+1
drones_arr[i][7]=drones_arr[i][7]-1
if drones_arr[i][7]<=0 then
local x1=zone[1]
local x2=zone[2]
local y1=zone[3]
local y2=zone[4]
if r_close2(px,py,x,y,350fx) then
local nx=fmath.random_fixedpoint(x1+20fx,x2-20fx)
local ny=fmath.random_fixedpoint(y1+20fx,y2-20fx)
if r_close2(px,py,nx,ny,350fx) then
repeat
nx=fmath.random_fixedpoint(x1,x2)
ny=fmath.random_fixedpoint(y1,y2)
until not r_close2(px,py,nx,ny,350fx)
drones_arr[i][5]=(nx-x)/80fx
drones_arr[i][6]=(ny-y)/80fx
drones_arr[i][7]=80
else
drones_arr[i][5]=(nx-x)/80fx
drones_arr[i][6]=(ny-y)/80fx
drones_arr[i][7]=80
end
else
local nx=x+fmath.random_fixedpoint(-100fx,100fx)
local ny=y+fmath.random_fixedpoint(-100fx,100fx)
if nx>x1 and nx<x2 and ny>y1 and ny<y2 then
drones_arr[i][5]=(nx-x)/40fx
drones_arr[i][6]=(ny-y)/40fx
drones_arr[i][7]=40
else
nx=x
ny=y
repeat
nx=x+fmath.random_fixedpoint(-100fx,100fx)
ny=y+fmath.random_fixedpoint(-100fx,100fx)
until nx>x1 and nx<x2 and ny>y1 and ny<y2
drones_arr[i][5]=(nx-x)/40fx
drones_arr[i][6]=(ny-y)/40fx
drones_arr[i][7]=40
end
end
else
pewpew.entity_set_position(drones_arr[i][1],x+drones_arr[i][5],y+drones_arr[i][6])
end
local dx=px-x
local dy=py-y
local ang=fmath.tau()/4fx-fmath.atan2(dx,dy)
if drones_arr[i][4]>=20 then
drones_arr[i][4]=0
table.insert(simple_bullets_arr,create_bullet_arrow(ship_id,px,py,x,y))
end
pewpew.customizable_entity_set_mesh_angle(drones_arr[i][1],ang,0fx,0fx,1fx)
if r_close2(px,py,x,y,35fx) then
pewpew.customizable_entity_start_exploding(drones_arr[i][1],50)
table.insert(numbers,i)
pewpew.add_damage_to_player_ship(ship_id,1)
end
end
end
end
for n=#numbers,1,-1 do
table.remove(drones_arr,numbers[n])
end
end
return drones_arr,simple_bullets_arr
end

function ai_healing_drone(px,py,ship_id,entity_id,drones_arr,health)
if #drones_arr~=0 then
local numbers={}
for i=1,#drones_arr do
if drones_arr[i][3] then
if pewpew.entity_get_is_alive(drones_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(drones_arr[i][1]) then
local x,y=pewpew.entity_get_position(drones_arr[i][1])
local ex,ey=pewpew.entity_get_position(entity_id)
drones_arr[i][5]=orbit_moving(drones_arr[i][1],drones_arr[i][5],ex,ey,150fx,80fx)
drones_arr[i][4]=drones_arr[i][4]+1
if drones_arr[i][4]>=100 then
drones_arr[i][4]=0
if health<=14 then
health=health+1
end
end
if r_close2(px,py,x,y,25fx) then
pewpew.customizable_entity_start_exploding(drones_arr[i][1],50)
table.insert(numbers,i)
pewpew.add_damage_to_player_ship(ship_id,1)
end
end
end
end
for n=#numbers,1,-1 do
table.remove(drones_arr,numbers[n])
end
end
return drones_arr,health
end