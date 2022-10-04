c_vertexes={}
c_colors={}
c_segments={}

local r1=250
local r2=250
local r3=250
local entities=250
local steps=10
local index=0

function a_color(re, gr, bl, al)
  local color = re * 256 + gr
  color = color * 256 + bl
  color = color * 256 + al
  return color
end

function random_colors(amount)
local variants=math.random(1,3)
local colors={}
local alpha=math.floor(255/amount)
if variants==1 then
for i=1,amount do
table.insert(colors,a_color(math.random(149,255),math.random(149,255),math.random(149,255),alpha*i))
end
end
if variants==2 then
local v=math.random(1,3)
if v==1 then 
for i=1,amount do
table.insert(colors,a_color(math.random(49,149),math.random(149,255),math.random(149,255),alpha*i))
end end
if v==2 then 
for i=1,amount do
table.insert(colors,a_color(math.random(149,255),math.random(49,149),math.random(149,255),alpha*i))
end end
if v==3 then 
for i=1,amount do
table.insert(colors,a_color(math.random(149,255),math.random(149,255),math.random(49,149),alpha*i))
end end
end
if variants==3 then
local v=math.random(1,3)
if v==1 then 
for i=1,amount do
table.insert(colors,a_color(math.random(49,149),math.random(49,149),math.random(149,255),alpha*i))
end end
if v==2 then 
for i=1,amount do
table.insert(colors,a_color(math.random(149,255),math.random(49,149),math.random(49,149),alpha*i))
end end
if v==3 then 
for i=1,amount do
table.insert(colors,a_color(math.random(49,149),math.random(149,255),math.random(49,149),alpha*i))
end end
end
return colors
end

function random_color()
local variants=math.random(1,3)
local color
if variants==1 then
color=a_color(math.random(149,255),math.random(149,255),math.random(149,255),255)
end
if variants==2 then
local v=math.random(1,3)
if v==1 then 
color=a_color(math.random(49,149),math.random(149,255),math.random(149,255),255)
end
if v==2 then 
color=a_color(math.random(149,255),math.random(49,149),math.random(149,255),255)
end
if v==3 then 
color=a_color(math.random(149,255),math.random(149,255),math.random(49,149),255)
end
end
if variants==3 then
local v=math.random(1,3)
if v==1 then 
color=a_color(math.random(49,149),math.random(49,149),math.random(149,255),255)
end
if v==2 then 
color=a_color(math.random(149,255),math.random(49,149),math.random(49,149),255)
end
if v==3 then 
color=a_color(math.random(49,149),math.random(149,255),math.random(49,149),255)
end
end
return color
end

while entities>0 do
local x=math.random(-3000,3000)/10
local y=math.random(-3000,3000)/10
local z=math.random(-3000,3000)/10
if x*x+y*y+z*z<r1*r1 then
local vect_x=math.random(-1000,1000)/100
local vect_y=math.random(-1000,1000)/100
local vect_z=math.random(-1000,1000)/100
local c1={}
c1=random_colors(steps)
for i=1,steps do
vect_x=vect_x+math.random(-500,500)/100
vect_y=vect_y+math.random(-500,500)/100
vect_z=vect_z+math.random(-500,500)/100
x=x+vect_x
y=y+vect_y
z=z+vect_z
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,c1[i])
end
local segm={}
for i=1,steps do
table.insert(segm,index)
index=index+1
end
table.insert(c_segments,segm)
entities=entities-1
end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}