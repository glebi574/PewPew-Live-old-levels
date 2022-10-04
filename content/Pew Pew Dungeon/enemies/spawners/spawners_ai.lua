function create_static_spawner(x,y)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/spawners/static_spawner.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
local spawner={id,15,0,{}}
return spawner
end

function ai_static_spawner(px,py,ship_id,zone,spawners_arr,simple_bullets_arr)
if #spawners_arr~=0 then
local numbers={}
for i=1,#spawners_arr do
if pewpew.entity_get_is_alive(spawners_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(spawners_arr[i][1]) then
pewpew.customizable_entity_add_rotation_to_mesh(spawners_arr[i][1],fmath.tau()/40fx,0fx,0fx,1fx)
local x,y=pewpew.entity_get_position(spawners_arr[i][1])
spawners_arr[i][3]=spawners_arr[i][3]+1
if spawners_arr[i][3]>=40 then
spawners_arr[i][3]=0
if #spawners_arr[i][4]<=5 then
local if_need_healer=true
if #spawners_arr[i][4]~=0 then
for m=1,#spawners_arr[i][4] do
if spawners_arr[i][4][3] then if_need_healer=false end
end
else if_need_healer=false end
if if_need_healer then
table.insert(spawners_arr[i][4],create_healing_drone(x+100fx,y))
else
table.insert(spawners_arr[i][4],create_attacker(x,y))
end
end
end
spawners_arr[i][4],simple_bullets_arr=ai_attacker(px,py,ship_id,zone,spawners_arr[i][4],simple_bullets_arr)
spawners_arr[i][4],spawners_arr[i][2]=ai_healing_drone(px,py,ship_id,spawners_arr[i][1],spawners_arr[i][4],spawners_arr[i][2])
if r_close2(px,py,x,y,70fx) then
if #spawners_arr[i][4]~=0 then
for k=1,#spawners_arr[i][4] do
pewpew.customizable_entity_start_exploding(spawners_arr[i][4][k][1],60)
end
end
pewpew.customizable_entity_start_exploding(spawners_arr[i][1],50)
table.insert(numbers,i)
pewpew.increase_score_of_player(0,170)
pewpew.add_damage_to_player_ship(ship_id,6)
end
end
end
for n=#numbers,1,-1 do
table.remove(spawners_arr,numbers[n])
end
end
return spawners_arr,simple_bullets_arr
end