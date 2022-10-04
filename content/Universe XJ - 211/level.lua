local functions1=require("/dynamic/functions.lua")

pewpew.set_level_size(100fx, 100fx)

local secrets=0

local levelborders1 = pewpew.new_customizable_entity(47000fx, 47000fx)
pewpew.customizable_entity_set_mesh(levelborders1, "/dynamic/levelborders.lua", 0)
local star1 = pewpew.new_customizable_entity(50000fx, 50000fx)
pewpew.customizable_entity_set_mesh(star1, "/dynamic/star_mesh.lua", 0)
local tutorial_start1=pewpew.new_customizable_entity(800fx,1200fx)
local tutorial_start2=pewpew.new_customizable_entity(1100fx,1100fx)
local tutorial_start3=pewpew.new_customizable_entity(400fx,1100fx)
local tutorial_start4=pewpew.new_customizable_entity(650fx,900fx)
local tutorial_start5=pewpew.new_customizable_entity(1100fx,900fx)
local tutorial_start01=pewpew.new_customizable_entity(800fx,1000fx)
pewpew.customizable_entity_set_mesh(tutorial_start01, "/dynamic/drone1.lua", 2)
pewpew.customizable_entity_set_string(tutorial_start1,"Use second joystick for special actions")
pewpew.customizable_entity_set_string(tutorial_start2,"1. Switch to combat mode")
pewpew.customizable_entity_set_string(tutorial_start3,"2. Switch to peaceful mode(every 10 seconds)")
pewpew.customizable_entity_set_string(tutorial_start4,"3. Menu")
pewpew.customizable_entity_set_string(tutorial_start5,"4. Absolutely nothing")

local tutorial_start11=pewpew.new_customizable_entity(2000fx,1200fx)
local tutorial_start12=pewpew.new_customizable_entity(2000fx,1175fx)
local tutorial_start13=pewpew.new_customizable_entity(2000fx,1150fx)
local tutorial_start14=pewpew.new_customizable_entity(2000fx,1125fx)
local tutorial_start15=pewpew.new_customizable_entity(2000fx,1100fx)
pewpew.customizable_entity_set_string(tutorial_start11,"When you switch to combat mode,")
pewpew.customizable_entity_set_string(tutorial_start12,"drone following you will appear")
pewpew.customizable_entity_set_string(tutorial_start13,"and will shoot at every nearby enemy.")
pewpew.customizable_entity_set_string(tutorial_start14,"To exit combat mode you should")
pewpew.customizable_entity_set_string(tutorial_start15,"switch to peaceful mode.")

local tutorial_start0=pewpew.new_customizable_entity(100fx,100fx)
local tutorial_start00=pewpew.new_customizable_entity(195fx,100fx)
pewpew.customizable_entity_set_string(tutorial_start0,"Secrets found:   /1")
pewpew.customizable_entity_set_string(tutorial_start00,secrets)

local ship_id=pewpew.new_player_ship(0fx,0fx,0)
local sh1=50
pewpew.configure_player(0, {shield = sh1})
pewpew.increase_score_of_player(0,10000)
local arr3=system1(50000fx,50000fx,1000fx,20000fx,400,2fx,2fx)
local arr1={}
local arr2={}
local arr_arr={}
local p_arr={}
local bullets={}
local enemies={}
local box_arr={}

for kk1=1,100 do --dust system generator
local a1=fmath.random_fixedpoint(0fx,100000fx)
local a2=fmath.random_fixedpoint(0fx,100000fx)
points_system(a1,a2,false)
end

for kk1=1fx,14fx,1fx do --system generator
local a1=fmath.random_fixedpoint(-3000fx,3000fx)+100000fx/14fx*kk1
for kk2=1fx,14fx,1fx do
local a2=fmath.random_fixedpoint(-3000fx,3000fx)+100000fx/14fx*kk2
local id1
local n1=fmath.random_int(0,1)
if n1==0 then id1=mesh1(a1,a2,16fx,"/dynamic/planet1.lua") else id1=mesh1(a1,a2,16fx,"/dynamic/planet2.lua") end
table.insert(arr1,id1)
table.insert(arr2,id1)
local id2=pewpew.add_arrow_to_player_ship(ship_id,id1,0x229966ff)
table.insert(arr_arr,id2)
end
end

for kk1=1,400 do --ids for moons generator
local a1=fmath.random_int(1,196)
table.insert(p_arr,a1)
end

for i=1,5 do
table.insert(box_arr,10)
end

pewpew.configure_player(0,{camera_distance=-500fx})

local time = 0
local cam_d=-500fx
local mn1=0
local x0=1000fx
local y0=1000fx
local nnn0=0
local n1=0fx
local ids1={}
local battle_mode=0
local drone1=0
local rotato=0fx
local sin_rotato=0fx
local box_a1=0
local dx=0fx
local dy=0fx
local int_t=0
local int_a=0
local rainbow=0
local color_r=49
local color_g=49
local color_b=49
local cycle1=1

function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if nnn0==0 then
  if sh1<0 then
    pewpew.stop_game()
	pewpew.entity_destroy(ship_id)
	nnn0=1
  end
  end
  if nnn0==0 then
time=time+1
n1=n1+1fx

--MOVEMENT start
x0,y0,dx,dy=movement1(ship_id,x0,y0,dx,dy)
dx,dy=gravitation_point_array(arr2,x0,y0,dx,dy,1000fx,1fx/30fx)
dx,dy=friction1(47000fx,53000fx,47000fx,53000fx,x0,y0,dx,dy,1fx/50fx)
--MOVEMENT end

--ORBITS start
for kk1=1,400 do
local id1=p_arr[kk1]
local x1,y1=pewpew.entity_get_position(arr1[id1])
arr3[kk1][1]=x1
arr3[kk1][2]=y1
end
system_orbit(arr3,n1)
--ORBITS end

--R_CLOSE start
--for rn=1,#enemies do
--if r_close(x0,y0,enemies[rn][1],50fx) then if pewpew.entity_get_is_alive(ship_id) then pewpew.configure_player(0, {shield = -1}) pewpew.entity_destroy(ship_id) end
--goto death
--end
--end

for rn=1,#arr1 do
if r_close(x0,y0,arr1[rn],640fx) then if pewpew.entity_get_is_alive(ship_id) then sh1=sh1-1 pewpew.configure_player(0, {shield = sh1}) end
end
end

for rn=1,#arr3 do
if r_close(x0,y0,arr3[rn][6],40fx) then if pewpew.entity_get_is_alive(ship_id) then sh1=sh1-1 pewpew.configure_player(0, {shield = sh1}) end
end
end

if r_close(x0,y0,star1,500fx) then if pewpew.entity_get_is_alive(ship_id) then pewpew.configure_player(0, {shield = -1}) sh1=-1 end end
--R_CLOSE end

mn1=control(4fx)

--CONTROL start
if time%30==0 then

if mn1==1 then
battle_mode=1
floating_message(x0,y0+25fx,"You are in combat mode now!",1fx,0xff0000ff,1)
if pewpew.entity_get_is_alive(drone1)==false then
drone1 = pewpew.new_customizable_entity(x0+75fx, y0)
pewpew.customizable_entity_set_mesh(drone1, "/dynamic/drone1.lua", 0)
pewpew.customizable_entity_set_position_interpolation(drone1,true)
end
end

if mn1==3 then
int_t=400
if int_a==0 then
int_a=1
box_arr[1]=pewpew.new_customizable_entity(x0-250fx,y0-100fx)
box_arr[2]=pewpew.new_customizable_entity(x0-125fx,y0-100fx)
box_arr[3]=pewpew.new_customizable_entity(x0,y0-100fx)
box_arr[4]=pewpew.new_customizable_entity(x0+125fx,y0-100fx)
box_arr[5]=pewpew.new_customizable_entity(x0+250fx,y0-100fx)
floating_message(x0-250fx,y0-150fx,"x,y",1fx,0xffffffff,1)
floating_message(x0-125fx,y0-150fx,"Info",1fx,0xffffffff,1)
floating_message(x0,y0-150fx,"Camera+",1fx,0xffffffff,1)
floating_message(x0+125fx,y0-150fx,"Camera-",1fx,0xffffffff,1)
floating_message(x0+250fx,y0-150fx,"Imagine",1fx,0xffffffff,1)
for i=1,5 do
pewpew.customizable_entity_set_mesh(box_arr[i], "/dynamic/boxes.lua", 5)
end
else
pewpew.entity_set_position(box_arr[1],x0-250fx,y0-100fx)
pewpew.entity_set_position(box_arr[2],x0-125fx,y0-100fx)
pewpew.entity_set_position(box_arr[3],x0,y0-100fx)
pewpew.entity_set_position(box_arr[4],x0+125fx,y0-100fx)
pewpew.entity_set_position(box_arr[5],x0+250fx,y0-100fx)
floating_message(x0-250fx,y0-150fx,"x,y",1fx,0xffffffff,1)
floating_message(x0-125fx,y0-150fx,"Info",1fx,0xffffffff,1)
floating_message(x0,y0-150fx,"Camera+",1fx,0xffffffff,1)
floating_message(x0+125fx,y0-150fx,"Camera-",1fx,0xffffffff,1)
floating_message(x0+250fx,y0-150fx,"Imagine",1fx,0xffffffff,1)
end
end

end

if time%300==0 then if mn1==2 then
battle_mode=0
floating_message(x0,y0+25fx,"You are in peaceful mode now!",1fx,0x00ff00ff,1)
if pewpew.entity_get_is_alive(drone1)==true then pewpew.entity_destroy(drone1) end
end
end
--CONTROL end

if int_t>0 then
int_t=int_t-1
else
if int_a==1 then
int_a=0
for i=1,5 do
pewpew.entity_destroy(box_arr[i])
end
end
end

if int_a==1 then
if time%30==0 then
if r_close(x0,y0,box_arr[1],50fx) then
floating_message(x0,y0+25fx,x0,1fx,0xffffffff,1)
floating_message(x0,y0-25fx,y0,1fx,0xffffffff,1)
end
if r_close(x0,y0,box_arr[2],50fx) then
floating_message(x0,y0+75fx,"Use second joystick for special actions",1fx,0xffffffff,1)
floating_message(x0,y0+50fx,"1. Switch to combat mode",1fx,0xffffffff,1)
floating_message(x0,y0+25fx,"2. Switch to peaceful mode(every 10 seconds)",1fx,0xffffffff,1)
floating_message(x0,y0-25fx,"3. Menu",1fx,0xffffffff,1)
floating_message(x0,y0-50fx,"4. Absolutely nothing",1fx,0xffffffff,1)
end
if r_close(x0,y0,box_arr[5],50fx) then
if rainbow==0 then rainbow=1 secrets=secrets+1 pewpew.customizable_entity_set_string(tutorial_start00,secrets) else rainbow=0 pewpew.configure_player(0,{move_joystick_color=0xff0000ff}) pewpew.configure_player(0,{shoot_joystick_color=0xff0000ff}) end
end
end
if r_close(x0,y0,box_arr[3],50fx) then
cam_d=cam_d-100fx
pewpew.configure_player(0,{camera_distance=cam_d})
end
if r_close(x0,y0,box_arr[4],50fx) then
cam_d=cam_d+100fx
if cam_d>-100fx then cam_d=-100fx end
pewpew.configure_player(0,{camera_distance=cam_d})
end

end

if rainbow==1 then
if cycle1==1 then
if color_r<255 then
color_r=color_r+1
if color_g>49 then color_g=color_g-1 end
if color_b>49 then color_b=color_b-1 end
else cycle1=2 end
end
if cycle1==2 then
if color_g<255 then
color_g=color_g+1
if color_r>49 then color_r=color_r-1 end
if color_b>49 then color_b=color_b-1 end
else cycle1=3 end
end
if cycle1==3 then
if color_b<255 then
color_b=color_b+1
if color_g>49 then color_g=color_g-1 end
if color_r>49 then color_r=color_r-1 end
else cycle1=1 end
end
local c1=make_color(color_r,color_g,color_b,199)
pewpew.configure_player(0,{move_joystick_color=c1})
pewpew.configure_player(0,{shoot_joystick_color=c1})
end

if pewpew.entity_get_is_alive(drone1)==true then
pewpew.customizable_entity_set_mesh_angle(drone1,rotato,1fx,2fx,3fx)
rotato=rotato+1fx/20fx
local sin_x,cos_y=fmath.sincos(sin_rotato)
local rx=x0+sin_x*75fx
local ry=y0+cos_y*75fx
pewpew.entity_set_position(drone1,rx,ry)
sin_rotato=sin_rotato+1fx/20fx
if time%60==0 then bullets=bullet_drone(drone1,bullets,enemies) end
else sin_rotato=0fx end

x0,y0=borders(ship_id,x0,y0)
end
end

pewpew.add_update_callback(level_tick)