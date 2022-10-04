function create_main_menu(level,parameters,boxes,texts,names,meshes,coords,pos)

 boxes,texts,names,meshes=clear_old_objects(boxes,texts,names,meshes)
  
  parameters.fireworks={false,0,0}
  
  local bg0=pewpew.new_customizable_entity(0fx,0fx)
  pewpew.customizable_entity_set_mesh(bg0,"/dynamic/meshes/first_bg.lua",0)
  pewpew.customizable_entity_set_mesh_z(bg0,-1000fx)
  pewpew.customizable_entity_configure_music_response(bg0,{scale_z_start=1fx/2fx,scale_z_end=-1fx/2fx})
  table.insert(meshes.bg,bg0)
 
  level={}
  table.insert(level,create_zone(0fx,0fx,3000fx))
  
  coords={0fx,0fx}
  pewpew.configure_player(0,{shield=1})
  pos=0

local box=pewpew.new_customizable_entity(0fx,500fx)
pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --1
set_rotation_callback(box)
local box_part=pewpew.new_customizable_entity(0fx,500fx)
pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",0)
set_box_part_callback(box,box_part)
table.insert(boxes,box)

box=pewpew.new_customizable_entity(-500fx,0fx)
pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --2
set_rotation_callback(box)
box_part=pewpew.new_customizable_entity(-500fx,0fx)
pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",1)
set_box_part_callback(box,box_part)
table.insert(boxes,box)

box=pewpew.new_customizable_entity(500fx,0fx)
pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --3
set_rotation_callback(box)
box_part=pewpew.new_customizable_entity(500fx,0fx)
pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",2)
set_box_part_callback(box,box_part)
table.insert(boxes,box)

box=pewpew.new_customizable_entity(0fx,800fx)
pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --4
set_rotation_callback(box)
box_part=pewpew.new_customizable_entity(0fx,800fx)
pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",4)
set_box_part_callback(box,box_part)
table.insert(boxes,box)

local name=pewpew.new_customizable_entity(0fx,400fx)
pewpew.customizable_entity_set_string(name,"Training")
table.insert(names,name)
name=pewpew.new_customizable_entity(-500fx,-100fx)
pewpew.customizable_entity_set_string(name,"Start")
table.insert(names,name)
name=pewpew.new_customizable_entity(500fx,-100fx)
pewpew.customizable_entity_set_string(name,"Endless mode")
table.insert(names,name)
name=pewpew.new_customizable_entity(0fx,700fx)
pewpew.customizable_entity_set_string(name,"Settings")
table.insert(names,name)

bg0=pewpew.new_customizable_entity(-200fx,-100fx)
pewpew.customizable_entity_set_mesh(bg0,"/dynamic/meshes/texts/beginning.lua",0)
table.insert(meshes.texts,bg0)

 texts,names,meshes=set_string_z(texts,names,meshes)

return level,parameters,boxes,texts,names,meshes,coords,pos
end

function create_settings_menu(level,parameters,boxes,texts,names,meshes,coords,pos)

 boxes,texts,names,meshes=clear_old_objects(boxes,texts,names,meshes)
  
  local bg0=pewpew.new_customizable_entity(0fx,0fx)
  pewpew.customizable_entity_set_mesh(bg0,"/dynamic/meshes/first_bg.lua",0)
  pewpew.customizable_entity_set_mesh_z(bg0,-1000fx)
  pewpew.customizable_entity_configure_music_response(bg0,{scale_z_start=1fx/2fx,scale_z_end=-1fx/2fx})
  table.insert(meshes.bg,bg0)
  
  coords={0fx,0fx}
  
  pos=-1
  
  local box=pewpew.new_customizable_entity(0fx,-200fx,0)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --1
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(0fx,-200fx,0)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",4)
  set_box_part_callback(box,box_part)
  table.insert(boxes,box)
  
  box=pewpew.new_customizable_entity(-300fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --2
  set_rotation_callback(box)
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(-300fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",0)
  set_box_part_callback(box,box_part)
  table.insert(boxes,box)
  
  box=pewpew.new_customizable_entity(0fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --3
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(0fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",3)
  set_box_part_callback(box,box_part)
  table.insert(boxes,box)
  
  box=pewpew.new_customizable_entity(300fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --4
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(300fx,400fx,0)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/meshes/signs.lua",3)
  set_box_part_callback(box,box_part)
  table.insert(boxes,box)
  
  
  local name=pewpew.new_customizable_entity(0fx,-300fx)
  pewpew.customizable_entity_set_string(name,"Home")
  table.insert(names,name)
  name=pewpew.new_customizable_entity(-300fx,300fx)
  pewpew.customizable_entity_set_string(name,"RGB")
  set_part_callback(boxes[2],name)
  table.insert(names,name)

  texts,names,meshes=set_string_z(texts,names,meshes)
  
return level,parameters,boxes,texts,names,meshes,coords,pos
end

function create_tutorial(level,parameters,boxes,texts,names,meshes,coords,pos)

 boxes,texts,names,meshes=clear_old_objects(boxes,texts,names,meshes)
  
  coords={0fx,0fx}
  pewpew.configure_player(0, {shield = 10})
  level={}
  level,meshes=do_simple_level(6,1000fx,2,meshes)
  pos=1
  
  local bg0=pewpew.new_customizable_entity(-200fx,300fx)
  pewpew.customizable_entity_set_mesh(bg0,"/dynamic/meshes/texts/tutorial_1.lua",0)
  table.insert(meshes.texts,bg0)
  
  local box=pewpew.new_customizable_entity(0fx,-200fx,0)
  pewpew.customizable_entity_set_mesh(box,"/dynamic/meshes/box.lua",0) --1
  set_rotation_callback(box)
  box_part=pewpew.new_customizable_entity(0fx,-200fx,0)
  pewpew.customizable_entity_set_mesh(box_part,"/dynamic/bullets/bullets.lua",1)
  set_box_part_callback(box,box_part)
  table.insert(boxes,box)
  
  texts,names,meshes=set_string_z(texts,names,meshes)
  
return level,parameters,boxes,texts,names,meshes,coords,pos
end

function clear_old_objects(boxes,texts,names,meshes)

 for i=1,#boxes do
  if pewpew.entity_get_is_alive(boxes[i]) then
  pewpew.customizable_entity_start_exploding(boxes[i],80)
  end
 end
 for i=1,#names do
  pewpew.entity_destroy(names[i])
 end
 for i=1,#texts do
  pewpew.entity_destroy(texts[i])
 end
 for i=1,#meshes.texts do
  pewpew.customizable_entity_start_exploding(meshes.texts[i],80)
 end
 for i=1,#meshes.bg do
  pewpew.customizable_entity_start_exploding(meshes.bg[i],80)
 end
 for i=1,#meshes.level do
  pewpew.customizable_entity_start_exploding(meshes.level[i],80)
 end
  
  boxes={}
  names={}
  texts={}
  meshes.texts={}
  meshes.bg={}
  meshes.level={}
  
return boxes,texts,names,meshes
end

function clear_old_objects_min(boxes,texts,names,meshes)

 for i=1,#boxes do
  if pewpew.entity_get_is_alive(boxes[i]) then
  pewpew.customizable_entity_start_exploding(boxes[i],80)
  end
 end
 for i=1,#names do
  pewpew.entity_destroy(names[i])
 end
 for i=1,#texts do
  pewpew.entity_destroy(texts[i])
 end
 for i=1,#meshes.texts do
  pewpew.customizable_entity_start_exploding(meshes.texts[i],80)
 end
  
  boxes={}
  names={}
  texts={}
  meshes.texts={}
  
return boxes,texts,names,meshes
end

function set_string_z(texts,names,meshes)

 for i=1,#names do
  pewpew.customizable_entity_set_mesh_z(names[i],200fx)
 end
 for i=1,#texts do
  pewpew.customizable_entity_set_mesh_z(texts[i],200fx)
 end
 for i=1,#meshes.texts do
  pewpew.customizable_entity_set_mesh_z(meshes.texts[i],200fx)
 end
 
return texts,names,meshes
end

