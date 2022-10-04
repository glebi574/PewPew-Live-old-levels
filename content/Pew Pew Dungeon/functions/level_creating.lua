function do_level1(num,size,meshes)

local level={}
table.insert(level,create_zone(0fx,0fx,size))

local cx=0fx
local cy=0fx
local scx,scy
local if_f=0
local t1=0
local t2=0
local t3=0
local t4=0
for i=2,num do
scx=cx
scy=cy
::save::
local random_number=fmath.random_int(1,4)
if random_number==1 then cx=cx-size end
if random_number==2 then cy=cy-size end
if random_number==3 then cx=cx+size end
if random_number==4 then cy=cy+size end


for n=1,#level do
local x0=level[n][1]+size/2fx
local y0=level[n][3]+size/2fx
if x0==cx and y0==cy then
if_f=1
end
if x0==scx-size then t1=1 end
if x0==scx+size then t3=1 end
if y0==scy-size then t2=1 end
if y0==scy+size then t4=1 end
end

if t1+t2+t3+t4==4 then
local bx=0fx
local by=0fx
for n=1,#level do
local x0=level[n][1]+size/2fx
local y0=level[n][3]+size/2fx
if y0>=by then bx=x0 by=y0 end
end
cx=bx
cy=by+size
else if if_f==1 then 
if_f=0
t1=0
t2=0
t3=0
t4=0
cx=scx
cy=scy
goto save
end end

table.insert(level,create_zone(cx,cy,size))
local id=pewpew.new_customizable_entity(cx-size/2fx,cy-size/2fx)
pewpew.customizable_entity_set_mesh(id,"/dynamic/meshes/square.lua",0)
table.insert(meshes.level,id)
if i==num-1 then pewpew.customizable_entity_set_mesh_color(meshes.level[i],0xff0000ff) end
if i==num then pewpew.customizable_entity_set_mesh_color(meshes.level[i],0x00ff00ff) end
if i%2==0 then level[i][6]=true end

if_f=0
t1=0
t2=0
t3=0
t4=0
end
return level,meshes
end

function do_simple_level(num,size,direction,meshes)
local level={}
local x=0fx
local y=0fx
for i=1,num do
table.insert(level,create_zone(x,y,size))
local id=pewpew.new_customizable_entity(x-size/2fx,y-size/2fx)
pewpew.customizable_entity_set_mesh(id,"/dynamic/meshes/square.lua",0)
table.insert(meshes.level,id)
if i==num-1 then pewpew.customizable_entity_set_mesh_color(meshes.level[i],0xff0000ff) end
if i==num then pewpew.customizable_entity_set_mesh_color(meshes.level[i],0x00ff00ff) end
if i%2==0 then level[i][6]=true end
if direction==1 then
x=x+size
end
if direction==2 then
y=y+size
end
if direction==3 then
x=x-size
end
if direction==4 then
y=y-size
end
end
return level,meshes
end