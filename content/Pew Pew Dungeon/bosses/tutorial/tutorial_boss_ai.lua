function create_boss_tutorial(x,y)
local id_arr={}
local ang=0fx
for i=1,4 do
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_set_mesh(id,"/dynamic/bosses/tutorial/tutorial_boss.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
ang=ang-fmath.tau()/4fx
table.insert(id_arr,{id,ang})
end
pewpew.entity_set_position(id_arr[1][1],x+50fx,y)
pewpew.entity_set_position(id_arr[2][1],x,y-50fx)
pewpew.entity_set_position(id_arr[3][1],x-50fx,y)
pewpew.entity_set_position(id_arr[4][1],x,y+50fx)
pewpew.customizable_entity_set_mesh_color(id_arr[1][1],0xff0000ff)
pewpew.customizable_entity_set_mesh_color(id_arr[2][1],0x33ff33ff)
pewpew.customizable_entity_set_mesh_color(id_arr[3][1],0x3333ffff)
pewpew.customizable_entity_set_mesh_color(id_arr[4][1],0x992299ff)
local id=pewpew.new_customizable_entity(x,y)
local boss={x,y,40,0,id_arr,id,0fx}
return boss
end

function ai_boss_tutorial(px,py,boss_arr,boss_bullets_arr)
if #boss_arr~=0 then
local if_alive=true
for k=1,#boss_arr[1][5] do
if not pewpew.entity_get_is_alive(boss_arr[1][5][k][1]) or pewpew.entity_get_is_started_to_be_destroyed(boss_arr[1][5][k][1]) then if_alive=false end
end
if if_alive then
local bx,by=pewpew.entity_get_position(boss_arr[1][6])
for m=1,#boss_arr[1][5] do
pewpew.customizable_entity_add_rotation_to_mesh(boss_arr[1][5][m][1],fmath.random_fixedpoint(50fx,100fx)/600fx,fmath.random_fixedpoint(1fx,100fx)/100fx,fmath.random_fixedpoint(1fx,100fx)/100fx,fmath.random_fixedpoint(1fx,100fx)/100fx)
boss_arr[1][5][m][2]=orbit_moving3(boss_arr[1][5][m][1],boss_arr[1][5][m][2],bx,by,100fx,80fx)
end
boss_arr[1][7]=orbit_moving2(boss_arr[1][6],boss_arr[1][7],boss_arr[1][1],boss_arr[1][2],300fx,-160fx)
boss_arr[1][4]=boss_arr[1][4]+1
if boss_arr[1][4]>14 then
pewpew.play_ambient_sound("/dynamic/sounds/other.lua",1)
for z=1,#boss_arr[1][5] do
boss_arr[1][4]=0
local x,y=pewpew.entity_get_position(boss_arr[1][5][z][1])
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/bosses/tutorial/tutorial_boss.lua",1)
pewpew.customizable_entity_set_position_interpolation(id,true)
if z==1 then pewpew.customizable_entity_set_mesh_color(id,0xff0000ff) end
if z==2 then pewpew.customizable_entity_set_mesh_color(id,0x33ff33ff) end
if z==3 then pewpew.customizable_entity_set_mesh_color(id,0x3333ffff) end
if z==4 then pewpew.customizable_entity_set_mesh_color(id,0x992299ff) end
local dx=px-x
local dy=py-y
local ang=fmath.tau()/4fx-fmath.atan2(dx,dy)
local sin1,cos1=fmath.sincos(ang)
dx=cos1*20fx
dy=sin1*20fx
if z%2==0 then
dx=dx+fmath.random_fixedpoint(0fx,80fx)/10fx
dy=dy+fmath.random_fixedpoint(0fx,80fx)/10fx
ang=fmath.tau()/4fx-fmath.atan2(dx,dy)
end
pewpew.customizable_entity_set_mesh_angle(id,ang,0fx,0fx,1fx)
table.insert(boss_bullets_arr,{id,dx,dy,100})
end
end
if boss_arr[1][3]<=0 then
pewpew.entity_destroy(boss_arr[1][6])
for b=1,#boss_arr[1][5] do
pewpew.customizable_entity_start_exploding(boss_arr[1][5][b][1],200)
end
pewpew.increase_score_of_player(0,2000)
table.remove(boss_arr,1)
pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",1)
end
end
end
return boss_arr,boss_bullets_arr
end

function boss_tutorial_bullets_moving(boss_bullets_arr,ship_id,px,py)
if #boss_bullets_arr~=0 then
local numbers={}
local if_this_bullet=false
for i=1,#boss_bullets_arr do
if pewpew.entity_get_is_alive(boss_bullets_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(boss_bullets_arr[i][1]) then
local x,y=pewpew.entity_get_position(boss_bullets_arr[i][1])
local rx=x+boss_bullets_arr[i][2]
local ry=y+boss_bullets_arr[i][3]
pewpew.entity_set_position(boss_bullets_arr[i][1],rx,ry)
boss_bullets_arr[i][4]=boss_bullets_arr[i][4]-1
if boss_bullets_arr[i][4]<=0 then
pewpew.customizable_entity_start_exploding(boss_bullets_arr[i][1],20)
pewpew.create_explosion(x,y,0xff0000ff,1fx/2fx,8)
table.insert(numbers,i)
if_this_bullet=true
end
if r_close2(px,py,x,y,30fx) then
pewpew.add_damage_to_player_ship(ship_id,1)
pewpew.customizable_entity_start_exploding(boss_bullets_arr[i][1],20)
pewpew.create_explosion(x,y,0xff0000ff,1fx/2fx,8)
if not if_this_bullet then
table.insert(numbers,i)
end
end
if_this_bullet=false
end
end
for n=#numbers,1,-1 do
table.remove(boss_bullets_arr,numbers[n])
end
end
return boss_bullets_arr
end