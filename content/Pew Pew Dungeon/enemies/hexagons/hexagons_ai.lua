function create_hexagon1(x,y)
local id=pewpew.new_customizable_entity(x,y)
pewpew.customizable_entity_start_spawning(id,0)
pewpew.customizable_entity_set_mesh(id,"/dynamic/enemies/hexagons/hexagon.lua",0)
pewpew.customizable_entity_set_position_interpolation(id,true)
local hexagon={id,3,x,y,0fx,0fx,0}
return hexagon
end

function ai_hexagon1(px,py,ship_id,zone,hexagons_arr,simple_bullets_arr)
if #hexagons_arr~=0 then
local numbers={}
for i=1,#hexagons_arr do
if pewpew.entity_get_is_alive(hexagons_arr[i][1]) and not pewpew.entity_get_is_started_to_be_destroyed(hexagons_arr[i][1]) then
local x,y=pewpew.entity_get_position(hexagons_arr[i][1])
if hexagons_arr[i][5]<=0fx then
local x1=zone[1]
local x2=zone[2]
local y1=zone[3]
local y2=zone[4]
local nx=fmath.random_fixedpoint(x1+20fx,x2-20fx)
local ny=fmath.random_fixedpoint(y1+20fx,y2-20fx)
hexagons_arr[i][3]=nx
hexagons_arr[i][4]=ny
hexagons_arr[i][5]=fmath.sqrt((nx-x)*(nx-x)+(ny-y)*(ny-y))/10fx
hexagons_arr[i][6]=hexagons_arr[i][5]
end
hexagons_arr[i][7]=hexagons_arr[i][7]+1
hexagons_arr[i][5]=hexagons_arr[i][5]-1fx
local rx=x+(hexagons_arr[i][3]-x)/hexagons_arr[i][6]
local ry=y+(hexagons_arr[i][4]-y)/hexagons_arr[i][6]
pewpew.entity_set_position(hexagons_arr[i][1],rx,ry)
pewpew.customizable_entity_add_rotation_to_mesh(hexagons_arr[i][1],fmath.random_fixedpoint(30fx,50fx)/250fx,0fx,0fx,1fx)
if hexagons_arr[i][7]>20 then
hexagons_arr[i][7]=0
table.insert(simple_bullets_arr,create_bullet_arrow(ship_id,px,py,x,y))
end
if r_close2(px,py,x,y,25fx) then
pewpew.customizable_entity_start_exploding(hexagons_arr[i][1],50)
table.insert(numbers,i)
pewpew.increase_score_of_player(0,80)
pewpew.add_damage_to_player_ship(ship_id,2)
end
end
end
for n=#numbers,1,-1 do
table.remove(hexagons_arr,numbers[n])
end
end
return hexagons_arr,simple_bullets_arr
end