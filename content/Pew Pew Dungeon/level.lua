local functions1=require("/dynamic/functions/basics.lua")
local functions2=require("/dynamic/functions/mechanics.lua")
local functions3=require("/dynamic/functions/zones.lua")
local functions4=require("/dynamic/functions/level_creating.lua")
local functions5=require("/dynamic/functions/level_parts.lua")
local functions6=require("/dynamic/enemies/simple_functions.lua")
local enemies1=require("/dynamic/enemies/befs/befs_ai.lua")
local enemies2=require("/dynamic/enemies/hexagons/hexagons_ai.lua")
local enemies3=require("/dynamic/enemies/spawners/spawners_ai.lua")
local enemies4=require("/dynamic/enemies/drones/drones_ai.lua")
local bosses1=require("/dynamic/bosses/tutorial/tutorial_boss_ai.lua")

pewpew.set_level_size(10fx, 10fx)

local ship_id=pewpew.new_player_ship(0fx,0fx,0)
pewpew.configure_player(0,{camera_distance=-1250fx})

local time = 0
local death=false
local c1
local pos=0
local zone=1
local if_in_battle=false
local if_action=false
local shooting_level=0fx
local level={}
local bullets={}
local boxes={}
local texts={}
local names={}
local meshes={
bg={},
texts={},
level={}
}
local coords={0fx,0fx}
local s_coords={0fx,0fx}
local parameters=
{
fireworks={false,0,0}
}
local settings=
{
rgb={false,1,49,49,49},
delta_size={true,1000fx}
}
local enemies=
{
simple_bullets={arrows={}},
befs={},
hexagons={},
drones={},
spawners={},
static_spawners={},
 bosses=
 {
 bullets={},
 tutorial={}
 }
}

level,parameters,boxes,texts,names,meshes,coords,pos=create_main_menu(level,parameters,boxes,texts,names,meshes,coords,pos)



function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if conf["has_lost"] == true then
    pewpew.stop_game()
	death=true
  end
if not death then
 
 time=time+1
 s_coords[1]=coords[1]
 s_coords[2]=coords[2]
 zone=what_zone(coords[1],coords[2],level)
 
 coords[1],coords[2]=movement1(ship_id,coords[1],coords[2],20fx)
 
 if not if_in_battle then coords[1],coords[2]=zones(coords[1],coords[2],s_coords[1],s_coords[2],level) else coords[1],coords[2]=zones_local(coords[1],coords[2],s_coords[1],s_coords[2],level[zone]) end
 
 if settings.rgb[2]==1 then
 if settings.rgb[3]<255 then
 settings.rgb[3]=settings.rgb[3]+1
 if settings.rgb[4]>49 then settings.rgb[4]=settings.rgb[4]-1 end
 if settings.rgb[5]>49 then settings.rgb[5]=settings.rgb[5]-1 end
 else settings.rgb[2]=2 end
 end
 if settings.rgb[2]==2 then
 if settings.rgb[4]<255 then
 settings.rgb[4]=settings.rgb[4]+1
 if settings.rgb[3]>49 then settings.rgb[3]=settings.rgb[3]-1 end
 if settings.rgb[5]>49 then settings.rgb[5]=settings.rgb[5]-1 end
 else settings.rgb[2]=3 end
 end
 if settings.rgb[2]==3 then
 if settings.rgb[5]<255 then
 settings.rgb[5]=settings.rgb[5]+1
 if settings.rgb[4]>49 then settings.rgb[4]=settings.rgb[4]-1 end
 if settings.rgb[3]>49 then settings.rgb[3]=settings.rgb[3]-1 end
 else settings.rgb[2]=1 end
 end
 c1=make_color(settings.rgb[3],settings.rgb[4],settings.rgb[5],199)
 
 if settings.rgb[1] then
 pewpew.configure_player(0,{move_joystick_color=c1})
 pewpew.configure_player(0,{shoot_joystick_color=c1})
 end
 
 for i=1,#boxes do
 if pewpew.entity_get_is_alive(boxes[i]) and not pewpew.entity_get_is_started_to_be_destroyed(boxes[i]) then
 pewpew.customizable_entity_set_mesh_color(boxes[i],c1)
 pewpew.customizable_entity_set_mesh_scale(boxes[i],settings.delta_size[2]/1000fx)
 if settings.delta_size[1] then
 settings.delta_size[2]=settings.delta_size[2]+1fx
 else
 settings.delta_size[2]=settings.delta_size[2]-1fx
 end
 if settings.delta_size[2]<800fx then
 settings.delta_size[1]=true
 end
 if settings.delta_size[2]>1200fx then
 settings.delta_size[1]=false
 end
 end
 end
 
 if pos==0 then
 
 if box_activating(coords[1],coords[2],boxes[4]) then
 
 level,parameters,boxes,texts,names,meshes,coords,pos=create_settings_menu(level,parameters,boxes,texts,names,meshes,coords,pos)
  
 end
 
 if box_activating(coords[1],coords[2],boxes[1]) then
  
  level,parameters,boxes,texts,names,meshes,coords,pos=create_tutorial(level,parameters,boxes,texts,names,meshes,coords,pos)
  
 end
 
 end
  
  
  
  if pos==-1 then
  
  if box_activating(coords[1],coords[2],boxes[1]) then
  
  level,parameters,boxes,texts,names,meshes,coords,pos=create_main_menu(level,parameters,boxes,texts,names,meshes,coords,pos)

  end
  
  if box_activating(coords[1],coords[2],boxes[2]) then
  
  if not settings.rgb[1] then
  settings.rgb[1]=true
  else
  settings.rgb[1]=false
  end
  
  coords={0fx,0fx}
  
  end
  
  end
 
 
 
 if pos~=0 and pos~=-1 then
  
 level,coords[1],coords[2],if_in_battle,if_action=zone_activation(level,zone,coords[1],coords[2],if_in_battle)
 
  if time%7==0 then
   if shooting_level~=0fx then
    local bullet_info={}
    local n0
    n0,bullet_info=shooting1(coords[1],coords[2])
    if n0 then table.insert(bullets,bullet_info) end
   end
  end
 
 end
 
 
 
 if pos==1 then
  
  if zone==1 and level[1][5]==1 then
  
  if box_activating(coords[1],coords[2],boxes[1]) then
  
  shooting_level=1fx
  level[1][5]=2
  if_in_battle=false
  
  boxes,texts,names,meshes=clear_old_objects_min(boxes,texts,names,meshes)
  
  end
  
  end
  
  if zone==2 and if_action then
  
  for i=1,10 do
  table.insert(enemies.befs,create_bef1(fmath.random_fixedpoint(-450fx,450fx),fmath.random_fixedpoint(550fx,1450fx),fmath.random_fixedpoint(-500fx,500fx)/100fx,fmath.random_fixedpoint(-500fx,500fx)/100fx))
  end
  text=pewpew.new_customizable_entity(0fx,750fx)
  pewpew.customizable_entity_set_string(text,"There are different types of enemies")
  table.insert(texts,text)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
  end
  
  if zone==2 and level[2][5]==1 and #enemies.befs==0 then
  
  if_in_battle=false
  level[2][5]=2
  boxes,texts,names,meshes=clear_old_objects_min(boxes,texts,names,meshes)
  
  end
  
  if zone==3 and if_action then
  
  table.insert(enemies.hexagons,create_hexagon1(0fx,2000fx))
  text=pewpew.new_customizable_entity(0fx,1700fx)
  pewpew.customizable_entity_set_string(text,"Some enemies can have more then 1 shield")
  table.insert(texts,text)
  text=pewpew.new_customizable_entity(0fx,1650fx)
  pewpew.customizable_entity_set_string(text,"or will shoot at you")
  table.insert(texts,text)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
  end
  
  if zone==3 and level[3][5]==1 and #enemies.hexagons==0 then
  
  if_in_battle=false
  level[3][5]=2
  boxes,texts,names,meshes=clear_old_objects_min(boxes,texts,names,meshes)
  
  end
  
  if zone==4 and if_action then
  
  table.insert(enemies.static_spawners,create_static_spawner(0fx,3200fx))
  text=pewpew.new_customizable_entity(0fx,2600fx)
  pewpew.customizable_entity_set_string(text,"Some enemies can create new enemies")
  table.insert(texts,text)
  text=pewpew.new_customizable_entity(0fx,2550fx)
  pewpew.customizable_entity_set_string(text,"to defend themselves")
  table.insert(texts,text)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
  end
  
  if zone==4 and level[4][5]==1 and #enemies.static_spawners==0 then
  
  if_in_battle=false
  level[4][5]=2
  boxes,texts,names,meshes=clear_old_objects_min(boxes,texts,names,meshes)
  text=pewpew.new_customizable_entity(0fx,3100fx)
  pewpew.customizable_entity_set_string(text,"As you know, boss is waiting for you in the next room")
  table.insert(texts,text)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
  end
  
  if zone==5 and if_action then
  
  boxes,texts,names,meshes=clear_old_objects_min(boxes,texts,names,meshes)
  table.insert(enemies.bosses.tutorial,create_boss_tutorial(0fx,4000fx))
  
  end
  
  if zone==5 and level[5][5]==1 and #enemies.bosses.tutorial==0 then
  
  level[5][5]=2
  if_in_battle=false
  parameters.fireworks={true,400,time}
  
  text=pewpew.new_customizable_entity(0fx,4100fx)
  pewpew.customizable_entity_set_string(text,"You finished training!")
  table.insert(texts,text)
  
  name=pewpew.new_customizable_entity(0fx,4900fx)
  pewpew.customizable_entity_set_string(name,"Home")
  table.insert(names,name)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
  box=pewpew.new_customizable_entity(0fx,5000fx)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0)
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(0fx,5000fx)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",0)
  set_box_part_callback(box,box_part)
  set_rotation_callback(box_part)
  table.insert(boxes,box)
  
  end
  
  if level[5][5]==2 then
  
  if box_activating(coords[1],coords[2],boxes[1]) then
  
  level,parameters,boxes,texts,names,meshes,coords,pos=create_main_menu(level,parameters,boxes,texts,names,meshes,coords,pos)
  
  end
  
  end
  
 end
 
 
 
 enemies.simple_bullets.arrows=simple_bullets_moving(enemies.simple_bullets.arrows,ship_id,coords[1],coords[2])
 
 enemies.befs=ai_bef1(coords[1],coords[2],ship_id,level[zone],enemies.befs)
 
 enemies.hexagons,enemies.simple_bullets.arrows=ai_hexagon1(coords[1],coords[2],ship_id,level[zone],enemies.hexagons,enemies.simple_bullets.arrows)
 
 enemies.static_spawners,enemies.simple_bullets.arrows=ai_static_spawner(coords[1],coords[2],ship_id,level[zone],enemies.static_spawners,enemies.simple_bullets.arrows)
 
 enemies.bosses.tutorial=ai_boss_tutorial(coords[1],coords[2],enemies.bosses.tutorial,enemies.bosses.bullets)
 enemies.bosses.bullets=boss_tutorial_bullets_moving(enemies.bosses.bullets,ship_id,coords[1],coords[2])
 
 
 
 bullets,enemies=bullets_and_enemies(bullets,enemies)
 bullets_moving(bullets,shooting_level)
 bullets=bullets_removing(bullets)
 
 if parameters.fireworks[1] then
 parameters.fireworks[2]=parameters.fireworks[2]-1
 if (time-parameters.fireworks[3])%10==0 then
 do_fireworks(level[zone][1],level[zone][2],level[zone][3],level[zone][4])
 end
 if parameters.fireworks[2]<=0 then parameters.fireworks[1]=false end
 end
 
 if time%20==0 then  end
 
end
end

pewpew.add_update_callback(level_tick)