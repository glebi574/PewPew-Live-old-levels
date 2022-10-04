local functions1=require("/dynamic/functions/different.lua")
local functions2=require("/dynamic/functions/player_ai.lua")
local functions3=require("/dynamic/functions/mechanics.lua")

local background = pewpew.new_customizable_entity(0fx, 0fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)

local timer=2500
local timer_id=pewpew.new_customizable_entity(1000fx,500fx)
pewpew.customizable_entity_set_string(timer_id,timer)

local bg_arr1={}

for i=1,5 do
local bg = pewpew.new_customizable_entity(1000fx, 500fx)
pewpew.customizable_entity_set_mesh(bg, "/dynamic/bg_points.lua", 0)
pewpew.customizable_entity_set_mesh_angle(bg,fmath.to_fixedpoint(i-1)*fmath.tau()/5fx,0fx,0fx,1fx)
table.insert(bg_arr1,bg)
end

local bg_arr2={}

for i=1,5 do
local bg = pewpew.new_customizable_entity(1000fx, 500fx)
pewpew.customizable_entity_set_mesh(bg, "/dynamic/bg_points.lua", 0)
pewpew.customizable_entity_set_mesh_angle(bg,fmath.to_fixedpoint(i-1)*fmath.tau()/5fx,0fx,0fx,1fx)
table.insert(bg_arr2,bg)
end

local x=1000fx
local y=500fx

pewpew.set_level_size(x*2fx,y*2fx)
local ship_id=pewpew.new_player_ship(x,y,0)
pewpew.configure_player(0,{camera_distance=-1000fx,shield=5})

local time = 0
local death=false
local amount=1
local recharge_num=8

local settings={
delta_size={true,1000fx},
charge=0
}

local enemies={}
local bullets={}
local enemies_bullets={}
local cubes={}

for i=1,amount do
local ex
if i%2==0 then
ex=fmath.random_fixedpoint(300fx,700fx)
else
ex=fmath.random_fixedpoint(1300fx,1700fx)
end
local ey=fmath.random_fixedpoint(300fx,700fx)

create_player(ex,ey,enemies,3,8)

end

function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if conf["has_lost"] == true then
    pewpew.stop_game()
	death=true
	ship_id=bg_arr1[1]
  end
  
  time=time+1
  
if not death then
 
 timer=timer-1
 pewpew.customizable_entity_set_string(timer_id,timer)
 
 x,y=pewpew.entity_get_position(ship_id)
 
 if settings.charge<8 then
 settings.charge=settings.charge+1
 else
 shooting(x,y,bullets)
 settings.charge=0
 end
 
 bullets_callback(bullets,enemies)
 
 local if_clear=true
 for i=1,#enemies do
 if pewpew.entity_get_is_alive(enemies[i].id) then
 if_clear=false
 end
 end
 
 if if_clear or timer<=0 then
 
 if timer>0 then enemies={} end
 
 local conf=pewpew.get_player_configuration(0)
 pewpew.configure_player(0,{shield=conf.shield+amount})
 amount=amount+1
 recharge_num=recharge_num+1
 
 for i=1,amount do
 local ex
 if i%2==0 then
 ex=fmath.random_fixedpoint(300fx,700fx)
 else
 ex=fmath.random_fixedpoint(1300fx,1700fx)
 end
 local ey=fmath.random_fixedpoint(300fx,700fx)

 create_player(ex,ey,enemies,2+amount,recharge_num)

 end
 
 timer=2500
 
 end
 
end

 ai_player(ship_id,enemies,enemies_bullets)
 bullets_callback_enemy(enemies_bullets,ship_id,death)

 for i=1,5 do
 pewpew.customizable_entity_set_mesh_scale(bg_arr1[i],settings.delta_size[2]/1000fx)
 pewpew.customizable_entity_set_mesh_scale(bg_arr2[i],(3000fx-settings.delta_size[2])/1000fx)
 if settings.delta_size[1] then
 settings.delta_size[2]=settings.delta_size[2]+1fx/4fx
 else
 settings.delta_size[2]=settings.delta_size[2]-1fx/4fx
 end
 if settings.delta_size[2]<1000fx then
 settings.delta_size[1]=true
 end
 if settings.delta_size[2]>2000fx then
 settings.delta_size[1]=false
 end
 end

 if time%10==0 then
 
 local cx,cy
 repeat
 cx=fmath.random_fixedpoint(-900fx,2900fx)
 cy=fmath.random_fixedpoint(-900fx,1900fx)
 until not (cx>=0fx and cx<=2000fx and cy>=0fx and cy<=1000fx)
 
 local cube_id=pewpew.new_customizable_entity(cx,cy)
 pewpew.customizable_entity_set_mesh(cube_id,"/dynamic/cube.lua",0)
 pewpew.customizable_entity_set_position_interpolation(cube_id,true)
 pewpew.customizable_entity_set_mesh_z(cube_id,-2000fx)
 pewpew.customizable_entity_set_mesh_color(cube_id,0xffffff00)
 table.insert(cubes,{id=cube_id,z=-2000fx,alpha=0})
 
 end

 for i=#cubes,1,-1 do
 cubes[i].z=cubes[i].z+10fx
 pewpew.customizable_entity_set_mesh_z(cubes[i].id,cubes[i].z)
 if cubes[i].alpha<149 then
 cubes[i].alpha=cubes[i].alpha+1
 pewpew.customizable_entity_set_mesh_color(cubes[i].id,make_color(250,250,250,cubes[i].alpha))
 end
 if cubes[i].z>=2100fx then
 pewpew.entity_destroy(cubes[i].id)
 table.remove(cubes,i)
 end
 end

end

pewpew.add_update_callback(level_tick)