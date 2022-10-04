local functions1=require("/dynamic/functions.lua")

pewpew.set_level_size(10fx, 10fx)

local ship_id=pewpew.new_player_ship(-1000fx,0fx,0)

local static_meshes={}
local rotating_meshes={}
local animations={}

local meshes_to_rotate={}
local meshes_rgb={}



local id

for i=1fx,10fx,1fx do
	for k=0fx,3fx,1fx do
		id=pewpew.new_customizable_entity(k*2000fx,i*2000fx)
		table.insert(static_meshes,id)
	end
end



id=pewpew.new_customizable_entity(-2000fx, 2000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg1.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-3000fx, 2000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg2.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-4000fx, 2000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg3.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-5000fx, 2000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg4.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-2000fx, 3000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg5.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-3000fx, 3000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg6.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-4000fx, 3000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg7.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-5000fx, 3000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg8.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-2000fx, 4000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg9.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-3000fx, 4000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg10.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-4000fx, 4000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg11.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-5000fx, 4000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg12.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-2000fx, 5000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg13.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)

id=pewpew.new_customizable_entity(-3000fx, 5000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/meshes/rotating/bg14.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(rotating_meshes,id)



id=pewpew.new_customizable_entity(0fx, -500fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/animations/bg1.lua", 0)
table.insert(animations,id)

id=pewpew.new_customizable_entity(1000fx, -500fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/animations/bg2.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(animations,id)

id=pewpew.new_customizable_entity(1500fx, -500fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/animations/bg3.lua", 0)
table.insert(meshes_to_rotate,id)
table.insert(meshes_rgb,id)
table.insert(animations,id)

id=pewpew.new_customizable_entity(-2000fx, -1000fx)
pewpew.customizable_entity_set_mesh(id, "/dynamic/animations/bg4.lua", 0)
table.insert(animations,id)



local box_id1=pewpew.new_customizable_entity(-1600fx,8000fx)
pewpew.customizable_entity_set_mesh(box_id1,"/dynamic/meshes/other/box.lua",0)

local entities={}
local point={-3000fx,-500fx,0fx}



local t1=pewpew.new_customizable_entity(-1000fx,900fx)
local t2=pewpew.new_customizable_entity(-1000fx,880fx)
local t3=pewpew.new_customizable_entity(-1000fx,840fx)
pewpew.customizable_entity_set_string(t1,"Use halves of second joystick")
pewpew.customizable_entity_set_string(t2,"to increase or decrease camera height")
pewpew.customizable_entity_set_string(t3,"And also: there are no level boundaries :)")
pewpew.customizable_entity_set_mesh_z(t1,1600fx)
pewpew.customizable_entity_set_mesh_z(t2,1600fx)
pewpew.customizable_entity_set_mesh_z(t3,1600fx)

local box_t1=pewpew.new_customizable_entity(-1600fx,7800fx)
pewpew.customizable_entity_set_string(box_t1,"Hide if error")
pewpew.customizable_entity_set_mesh_z(box_t1,1000fx)

pewpew.configure_player(0,{camera_distance=-4000fx})

local time = 0
local x0=-1000fx
local y0=1000fx
local d1=-4000fx
local control_num

local rgb={0,1,49,49,49}
local frames={{0,0},{0,0},{0,0},{0,0},{0,0}}

function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if conf["has_lost"] == true then
    pewpew.stop_game()
  end
  
  control_num=control()
  x0,y0=movement1(ship_id,x0,y0,50fx)
  if control_num==1 then pewpew.configure_player(0,{camera_distance=d1}) d1=d1-50fx end
  if control_num==2 then pewpew.configure_player(0,{camera_distance=d1}) d1=d1+50fx end
  
  time=time+1
  
  if time==20 then
  pewpew.customizable_entity_set_mesh(static_meshes[1], "/dynamic/meshes/static/bg1.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[2], "/dynamic/meshes/static/bg2.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[3], "/dynamic/meshes/static/bg3.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[4], "/dynamic/meshes/static/bg4.lua", 0)
  end
  
  if time==40 then
  pewpew.customizable_entity_set_mesh(static_meshes[5], "/dynamic/meshes/static/bg5.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[6], "/dynamic/meshes/static/bg6.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[7], "/dynamic/meshes/static/bg7.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[8], "/dynamic/meshes/static/bg8.lua", 0)
  end
  
  if time==60 then
  pewpew.customizable_entity_set_mesh(static_meshes[9], "/dynamic/meshes/static/bg9.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[10], "/dynamic/meshes/static/bg10.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[11], "/dynamic/meshes/static/bg11.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[12], "/dynamic/meshes/static/bg12.lua", 0)
  end
  
  if time==80 then
  pewpew.customizable_entity_set_mesh(static_meshes[13], "/dynamic/meshes/static/bg13.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[14], "/dynamic/meshes/static/bg14.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[15], "/dynamic/meshes/static/bg15.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[16], "/dynamic/meshes/static/bg16.lua", 0)
  end
  
  if time==100 then
  pewpew.customizable_entity_set_mesh(static_meshes[17], "/dynamic/meshes/static/bg17.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[18], "/dynamic/meshes/static/bg18.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[19], "/dynamic/meshes/static/bg19.lua", 0)
  pewpew.customizable_entity_set_mesh(static_meshes[20], "/dynamic/meshes/static/bg20.lua", 0)
  end
  
  for n=1,#meshes_to_rotate do
  local ang1=fmath.random_fixedpoint(10fx,100fx)/100fx
  local ang2=fmath.random_fixedpoint(10fx,100fx)/100fx
  local ang3=fmath.random_fixedpoint(10fx,100fx)/100fx
  pewpew.customizable_entity_add_rotation_to_mesh(meshes_to_rotate[n],1fx/fmath.tau()/5fx,ang1,ang2,ang3)
  end
  
  if rgb[2]==1 then
  if rgb[3]<255 then
  rgb[3]=rgb[3]+1
  if rgb[4]>49 then rgb[4]=rgb[4]-1 end
  if rgb[5]>49 then rgb[5]=rgb[5]-1 end
  else rgb[2]=2 end
  end
  if rgb[2]==2 then
  if rgb[4]<255 then
  rgb[4]=rgb[4]+1
  if rgb[3]>49 then rgb[3]=rgb[3]-1 end
  if rgb[5]>49 then rgb[5]=rgb[5]-1 end
  else rgb[2]=3 end
  end
  if rgb[2]==3 then
  if rgb[5]<255 then
  rgb[5]=rgb[5]+1
  if rgb[4]>49 then rgb[4]=rgb[4]-1 end
  if rgb[3]>49 then rgb[3]=rgb[3]-1 end
  else rgb[2]=1 end
  end
  rgb[1]=make_color(rgb[3],rgb[4],rgb[5],199)
  
  for i=1,#meshes_rgb do
  pewpew.customizable_entity_set_mesh_color(meshes_rgb[i],rgb[1])
  end
  
  if time%4==0 then
  frames=frames_system(frames,1,animations[1],2,37,"/dynamic/animations/bg1.lua")
  end
  
  frames=frames_system(frames,2,animations[2],2,197,"/dynamic/animations/bg2.lua")
  frames=frames_system(frames,2,animations[3],2,197,"/dynamic/animations/bg3.lua")
  frames=frames_system(frames,3,animations[4],2,997,"/dynamic/animations/bg4.lua")
  
  if box_activating(x0,y0,box_id1) then
  pewpew.customizable_entity_start_exploding(static_meshes[13],100)
  end
  box_parts(box_id1,box_t1)
  
  end

pewpew.add_update_callback(level_tick)