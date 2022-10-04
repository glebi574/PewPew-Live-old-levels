local c_vertexes={}
local c_colors={}
local c_segments={}
meshes={}

local coords={}
local p1=40

local lines_num=250
local r1=500
local r2=500
local r3=500
local index = 0
local c1

function a_color(re, gr, bl, al)
  local color = re * 256 + gr
  color = color * 256 + bl
  color = color * 256 + al
  return color
end

function random_color()
local variants=math.random(1,3)
local color
if variants==1 then
color=a_color(math.random(149,255),math.random(149,255),math.random(149,255),math.random(149,255))
end
if variants==2 then
local v=math.random(1,3)
if v==1 then 
color=a_color(math.random(49,149),math.random(149,255),math.random(149,255),math.random(149,255))
end
if v==2 then 
color=a_color(math.random(149,255),math.random(49,149),math.random(149,255),math.random(149,255))
end
if v==3 then 
color=a_color(math.random(149,255),math.random(149,255),math.random(49,149),math.random(149,255))
end
end
if variants==3 then
local v=math.random(1,3)
if v==1 then 
color=a_color(math.random(49,149),math.random(49,149),math.random(149,255),math.random(149,255))
end
if v==2 then 
color=a_color(math.random(149,255),math.random(49,149),math.random(49,149),math.random(149,255))
end
if v==3 then 
color=a_color(math.random(49,149),math.random(149,255),math.random(49,149),math.random(149,255))
end
end
return color
end

while lines_num>0 do
local x=math.random(-3000,3000)/10
local y=math.random(-3000,3000)/10
local z=math.random(-3000,3000)/10
if x*x+y*y+z*z<r1*r1 then
table.insert(c_vertexes,{x+10,y,z})
table.insert(c_vertexes,{x-10,y,z})
c1=random_color()
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(coords,{x,y,z})
table.insert(c_segments,{index,index+1})
lines_num=lines_num-1
index=index+2
end
end

for phase=1,p1 do
c_vertexes={}
for n=1,#coords do
local rp1=math.random(-300,300)/10
local rp2=math.random(-300,300)/10
local rp3=math.random(-300,300)/10
local x0=coords[n][1]+rp1
local y0=coords[n][2]+rp2
local z0=coords[n][3]+rp3
table.insert(c_vertexes,{x0+10,y0,z0})
table.insert(c_vertexes,{x0-10,y0,z0})
coords[n]={x0,y0,z0}
end

table.insert(meshes,{vertexes = c_vertexes,segments = c_segments,colors = c_colors})
end