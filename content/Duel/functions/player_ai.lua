function create_player(x,y,entities,lifes_amount,rn)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,10)
local t=fmath.random_int(0,3)
pewpew.customizable_entity_set_mesh(id,"/dynamic/ship.lua",t)
pewpew.customizable_entity_set_position_interpolation(id,true)
pewpew.entity_set_radius(id,30fx)
local entity={
id=id,
lifes=lifes_amount,
recharge=rn+fmath.random_int(-7,7),
recharge_num=rn,
vect_x=0fx,
vect_y=0fx,
ship_type=t
}
table.insert(entities,entity)
end

function ai_player(ship_id,players_arr,bullets_arr)
if #players_arr~=0 then
for i=1,#players_arr do
if pewpew.entity_get_is_alive(players_arr[i].id) and not pewpew.entity_get_is_started_to_be_destroyed(players_arr[i].id) then

local px,py=pewpew.entity_get_position(ship_id)
local ex,ey=pewpew.entity_get_position(players_arr[i].id)

if players_arr[i].recharge>0 then
players_arr[i].recharge=players_arr[i].recharge-1
else
players_arr[i].recharge=players_arr[i].recharge_num
local dx=px-ex
local dy=py-ey
local no0,p_a,no1,no2=pewpew.get_player_inputs(0)
local ang
if p_a~=0fx then ang=fmath.atan2(dy,dx)+fmath.random_fixedpoint(-1000fx,1000fx)/1000fx else
ang=fmath.atan2(dy,dx)+fmath.random_fixedpoint(-1000fx,1000fx)/3000fx end
local dy,dx=fmath.sincos(ang)
create_custom_bullet(ex,ey,ang,dx*20fx,dy*20fx,players_arr[i].ship_type,bullets_arr)
pewpew.play_ambient_sound("/dynamic/shots.lua",2)
end

local vect_x=players_arr[i].vect_x
local vect_y=players_arr[i].vect_y

if vect_x==0fx then
vect_x=fmath.random_fixedpoint(-1000fx,1000fx)/100fx
end
if vect_y==0fx then
vect_y=fmath.random_fixedpoint(-1000fx,1000fx)/100fx
end

if ex+vect_x>1800fx then vect_x=vect_x-1fx/4fx end
if ex+vect_x<200fx then vect_x=vect_x+1fx/4fx end
if ey+vect_y>900fx then vect_y=vect_y-1fx/4fx end
if ey+vect_y<100fx then vect_y=vect_y+1fx/4fx end

vect_x=vect_x+fmath.random_fixedpoint(-7000fx,7000fx)/10000fx
vect_y=vect_y+fmath.random_fixedpoint(-7000fx,7000fx)/10000fx

players_arr[i].vect_x=vect_x
players_arr[i].vect_y=vect_y
local rx=ex+vect_x
local ry=ey+vect_y
if rx<0fx then rx=1fx end
if rx>2000fx then rx=1999fx end
if ry<0fx then ry=1fx end
if ry>1000fx then ry=999fx end
pewpew.entity_set_position(players_arr[i].id,rx,ry)
pewpew.customizable_entity_set_mesh_angle(players_arr[i].id,fmath.atan2(vect_y,vect_x),0fx,0fx,1fx)

if players_arr[i].lifes<=0 then
pewpew.customizable_entity_start_exploding(players_arr[i].id,100)
pewpew.increase_score_of_player(0,1001)
end

end
end
end
end