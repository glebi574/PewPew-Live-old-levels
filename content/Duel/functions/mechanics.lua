
function shooting(x,y,bullets_arr)
local no1,no2,ang,a=pewpew.get_player_inputs(0)
if a~=0fx then
local bullet_id=pewpew.new_player_bullet(x,y,ang,0)
table.insert(bullets_arr,bullet_id)
pewpew.play_ambient_sound("/dynamic/shots.lua",0)
end
end

function bullets_callback(bullets_arr,enemies_arr)

for i=#bullets_arr,1,-1 do
if not pewpew.entity_get_is_alive(bullets_arr[i]) then
table.remove(bullets_arr,i)
end
end

for i=#bullets_arr,1,-1 do

for n=1,#enemies_arr do

if pewpew.entity_get_is_alive(enemies_arr[n].id) and not pewpew.entity_get_is_started_to_be_destroyed(enemies_arr[n].id) then
 if r_close(bullets_arr[i],enemies_arr[n].id,30fx) then
 local x,y=pewpew.entity_get_position(bullets_arr[i])
 pewpew.entity_destroy(bullets_arr[i])
 table.remove(bullets_arr,i)
 pewpew.create_explosion(x,y,0xffffff66,2fx,10)
 enemies_arr[n].lifes=enemies_arr[n].lifes-1
 pewpew.play_ambient_sound("/dynamic/shots.lua",1)
 break
 end
end

end

end

end

function create_custom_bullet(x,y,ang,dx,dy,ship_type,custom_bullets_arr)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/bullets.lua",ship_type)
pewpew.customizable_entity_set_mesh_angle(id,ang,0fx,0fx,1fx)
pewpew.customizable_entity_set_position_interpolation(id,true)
table.insert(custom_bullets_arr,{id=id,dx=dx,dy=dy,timer=100})
end

function bullets_callback_enemy(bullets_arr,id,death)

for i=#bullets_arr,1,-1 do
if not pewpew.entity_get_is_alive(bullets_arr[i].id) then
table.remove(bullets_arr,i)
end
end

for i=#bullets_arr,1,-1 do
 
 local x,y=pewpew.entity_get_position(bullets_arr[i].id)
 pewpew.entity_set_position(bullets_arr[i].id,x+bullets_arr[i].dx,y+bullets_arr[i].dy)
 bullets_arr[i].timer=bullets_arr[i].timer-1
 
 if x<0fx or x>2000fx or y<0fx or y>1000fx then
 pewpew.entity_destroy(bullets_arr[i].id)
 table.remove(bullets_arr,i)
 pewpew.create_explosion(x,y,0xffffff66,1fx/2fx,10)
 goto destroyed
 end
 
 if bullets_arr[i].timer<0 then
 pewpew.entity_destroy(bullets_arr[i].id)
 table.remove(bullets_arr,i)
 pewpew.create_explosion(x,y,0xffffff66,1fx/2fx,10)
 goto destroyed
 end

if not death then
if pewpew.entity_get_is_alive(id) then
 if r_close(bullets_arr[i].id,id,30fx) then
 pewpew.entity_destroy(bullets_arr[i].id)
 table.remove(bullets_arr,i)
 pewpew.create_explosion(x,y,0xffffff66,2fx,10)
 pewpew.add_damage_to_player_ship(id,1)
 end
end
end

 ::destroyed::

end

end