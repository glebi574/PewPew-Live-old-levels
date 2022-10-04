
function box_activating(x,y,box_id)
 if pewpew.entity_get_is_alive(box_id) and not pewpew.entity_get_is_started_to_be_destroyed(box_id) then
  if r_close(x,y,box_id,75fx) then
   pewpew.customizable_entity_start_exploding(box_id,80)
   pewpew.play_ambient_sound("/dynamic/sounds/other.lua",0)
   return true else return false
  end
 else return false
 end
end

function box_activating_unbreakable(x,y,box_id)
 if pewpew.entity_get_is_alive(box_id) and not pewpew.entity_get_is_started_to_be_destroyed(box_id) then
  if r_close(x,y,box_id,75fx) then
   return true else return false
  end
 else return false
 end
end

function set_box_part_callback(box_id,box_part_id)
pewpew.entity_set_update_callback(box_part_id,function()
 if not pewpew.entity_get_is_alive(box_id) or pewpew.entity_get_is_started_to_be_destroyed(box_id) then
  if pewpew.entity_get_is_alive(box_part_id) and not pewpew.entity_get_is_started_to_be_destroyed(box_part_id) then
   pewpew.customizable_entity_start_exploding(box_part_id,80)
  end
 else
 pewpew.customizable_entity_add_rotation_to_mesh(box_part_id,
 fmath.random_fixedpoint(50fx,100fx)/600fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx)
 end
end)
end

function set_part_callback(id,part_id)
pewpew.entity_set_update_callback(part_id,function()
 if not pewpew.entity_get_is_alive(id) or pewpew.entity_get_is_started_to_be_destroyed(id) then
  if pewpew.entity_get_is_alive(part_id) and not pewpew.entity_get_is_started_to_be_destroyed(part_id) then
   pewpew.customizable_entity_start_exploding(part_id,80)
  end
 end
end)
end

function set_rotation_callback(id)
pewpew.entity_set_update_callback(id,function()
 if pewpew.entity_get_is_alive(id) then
 pewpew.customizable_entity_add_rotation_to_mesh(id,
 fmath.random_fixedpoint(50fx,100fx)/600fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx,
 fmath.random_fixedpoint(1fx,100fx)/100fx)
 end
end)
end

function do_fireworks(x1,x2,y1,y2)
local x=fmath.random_fixedpoint(x1,x2)
local y=fmath.random_fixedpoint(y1,y2)
local rand_int=fmath.random_int(1,4)
if rand_int==1 then pewpew.create_explosion(x,y,0xff0000ff,2fx,10) end
if rand_int==2 then pewpew.create_explosion(x,y,0x33ff33ff,2fx,10) end
if rand_int==3 then pewpew.create_explosion(x,y,0x3333ffff,2fx,10) end
if rand_int==4 then pewpew.create_explosion(x,y,0x992299ff,2fx,10) end
end

function shooting1(x,y)
local no1,no2,ang,no3=pewpew.get_player_inputs(0)
if no3~=0fx then
local bullet=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_set_mesh(bullet,"/dynamic/bullets/bullets.lua",0)
pewpew.customizable_entity_set_mesh_angle(bullet,ang,0fx,0fx,1fx)
pewpew.customizable_entity_start_spawning(bullet,0)
pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",3)
local dy,dx=fmath.sincos(ang)
local bullet_info={bullet,dx,dy,150}
return true,bullet_info
else return false,{} end
end

function bullets_moving(bullets_arr,level)
if #bullets_arr~=0 then
for i=1,#bullets_arr do
local x,y=pewpew.entity_get_position(bullets_arr[i][1])
local rx=x+bullets_arr[i][2]*level*5fx
local ry=y+bullets_arr[i][3]*level*5fx
pewpew.entity_set_position(bullets_arr[i][1],rx,ry)
end
end
end

function bullets_removing(bullets_arr)
if #bullets_arr~=0 then
local numbers={}
for i=1,#bullets_arr do
bullets_arr[i][4]=bullets_arr[i][4]-1
if bullets_arr[i][4]<=0 then
local x,y=pewpew.entity_get_position(bullets_arr[i][1])
pewpew.create_explosion(x,y,0xffffffff,1fx/4fx,5)
pewpew.entity_destroy(bullets_arr[i][1])
table.insert(numbers,i) end
end
for n=#numbers,1,-1 do
table.remove(bullets_arr,numbers[n])
end
end
return bullets_arr
end

function bullets_and_enemies_arrs(bullets_arr,enemies_arr,r,score) --without health
local num
local if_destroyed=false
for i=1,#bullets_arr do
  local bx,by=pewpew.entity_get_position(bullets_arr[i][1])
  for n=1,#enemies_arr do
   if r_close(bx,by,enemies_arr[n][1],r) then
    bullets_arr[i][4]=0
	if_destroyed=true
	num=n
    end
  end
  if if_destroyed then
  pewpew.customizable_entity_start_exploding(enemies_arr[num][1],50)
  table.remove(enemies_arr,num)
  pewpew.increase_score_of_player(0,score)
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",0)
  if_destroyed=false
  end
 end
return bullets_arr,enemies_arr
end

function bullets_and_enemies_arrs_with_health(bullets_arr,enemies_arr,r,score) --with health
local num
local if_damaged=false
for i=1,#bullets_arr do
  local bx,by=pewpew.entity_get_position(bullets_arr[i][1])
  for n=1,#enemies_arr do
   if r_close(bx,by,enemies_arr[n][1],r) then
    bullets_arr[i][4]=0
	if_damaged=true
	num=n
    end
  end
  if if_damaged then
  if enemies_arr[num][2]==0 then
  pewpew.customizable_entity_start_exploding(enemies_arr[num][1],50)
  table.remove(enemies_arr,num)
  pewpew.increase_score_of_player(0,score)
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",0)
  else
  pewpew.create_explosion(bx,by,0x33ff33ff,1fx/2fx,8)
  enemies_arr[num][2]=enemies_arr[num][2]-1
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",2)
  end
  if_damaged=false
  end
 end
return bullets_arr,enemies_arr
end

function bullets_and_enemies_arrs_mothership(bullets_arr,enemies_arr,r,score) --motherships
local num
local if_damaged=false
for i=1,#bullets_arr do
  local bx,by=pewpew.entity_get_position(bullets_arr[i][1])
  for n=1,#enemies_arr do
   if r_close(bx,by,enemies_arr[n][1],r) then
    bullets_arr[i][4]=0
	if_damaged=true
	num=n
    end
  end
  if if_damaged then
  if enemies_arr[num][2]==0 then
  pewpew.customizable_entity_start_exploding(enemies_arr[num][1],50)
  if #enemies_arr[num][4]~=0 then
  for k=1,#enemies_arr[num][4] do
  pewpew.customizable_entity_start_exploding(enemies_arr[num][4][k][1],50)
  end
  end
  table.remove(enemies_arr,num)
  pewpew.increase_score_of_player(0,score)
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",0)
  else
  pewpew.create_explosion(bx,by,0x33ff33ff,1fx/2fx,8)
  enemies_arr[num][2]=enemies_arr[num][2]-1
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",2)
  end
  if_damaged=false
  end
 end
return bullets_arr,enemies_arr
end

function bullets_and_enemies_arrs_boss(bullets_arr,enemies_arr,r) --can't be destroyed there
local num
local if_damaged=false
for i=1,#bullets_arr do
  local bx,by=pewpew.entity_get_position(bullets_arr[i][1])
  for n=1,#enemies_arr do
   if r_close(bx,by,enemies_arr[n][6],r) then
    bullets_arr[i][4]=0
	if_damaged=true
	num=n
    end
  end
  if if_damaged then
  pewpew.create_explosion(bx,by,0x33ff33ff,2fx,8)
  enemies_arr[num][3]=enemies_arr[num][3]-1
  pewpew.play_ambient_sound("/dynamic/sounds/to_enemies.lua",2)
  if_damaged=false
  end
 end
return bullets_arr,enemies_arr
end

function bullets_and_enemies(bullets_arr,enemies_arr)
if #bullets_arr~=0 then
if #enemies_arr.befs~=0 then
 bullets_arr,enemies_arr.befs=bullets_and_enemies_arrs(bullets_arr,enemies_arr.befs,35fx,20)
end
if #enemies_arr.hexagons~=0 then
 bullets_arr,enemies_arr.hexagons=bullets_and_enemies_arrs_with_health(bullets_arr,enemies_arr.hexagons,40fx,100)
end
if #enemies_arr.drones~=0 then
 
end

if #enemies_arr.spawners~=0 then
 
end

if #enemies_arr.static_spawners~=0 then
 bullets_arr,enemies_arr.static_spawners=bullets_and_enemies_arrs_mothership(bullets_arr,enemies_arr.static_spawners,70fx,200)
 for m=1,#enemies_arr.static_spawners do
 if #enemies_arr.static_spawners[m][4]~=0 then
 if enemies_arr.static_spawners[m][4][3] then
 bullets_arr,enemies_arr.static_spawners[m][4]=bullets_and_enemies_arrs_with_health(bullets_arr,enemies_arr.static_spawners[m][4],25fx,0)
 else
 bullets_arr,enemies_arr.static_spawners[m][4]=bullets_and_enemies_arrs_with_health(bullets_arr,enemies_arr.static_spawners[m][4],35fx,0)
 end
 end
 end
end

if #enemies_arr.bosses.tutorial~=0 then
 bullets_arr,enemies_arr.bosses.tutorial=bullets_and_enemies_arrs_boss(bullets_arr,enemies_arr.bosses.tutorial,80fx)
end

end
return bullets_arr,enemies_arr
end