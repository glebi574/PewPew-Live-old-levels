local c_vertexes={}
local c_colors={}
local c_segments={}
meshes={}

local p1=1000
local entities=10
local dist_x=1000
local dist_y=1000
local dist_z=1000

local points={}
local coords={}

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

while entities>0 do
local x=math.random(-dist_x+100,dist_x-100)
local y=math.random(-dist_y+100,dist_y-100)
local z=math.random(-dist_z+100,dist_z-100)
local vect_x=math.random(-1000,1000)/100
local vect_y=math.random(-1000,1000)/100
local vect_z=math.random(-1000,1000)/100
local c1=random_color()
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,c1)
table.insert(points,{vect_x,vect_y,vect_z})
table.insert(coords,{x,y,z})
entities=entities-1
end

entities=10

local u_segm={}
for i=0,#c_vertexes-1 do
table.insert(u_segm,i)
if i==#c_vertexes-1 then table.insert(u_segm,0) end
end
table.insert(c_segments,u_segm)

local repeating=3
while repeating>0 do
local rn1=math.random(0,#c_vertexes-1)
local rn2=math.random(1,#c_vertexes-1)
if rn1~=rn2 and rn1+1~=rn2 and rn1-1~=rn2 then
table.insert(c_segments,{rn1,rn2})
repeating=repeating-1
end
end

for phase=1,p1 do
table.insert(meshes,{vertexes = c_vertexes,segments = c_segments,colors = c_colors})
c_vertexes={}
for i=1,entities do
if coords[i][1]<-dist_x+250 then
points[i][1]=points[i][1]+2
end
if coords[i][1]>dist_x-250 then
points[i][1]=points[i][1]-2
end
if coords[i][2]<-dist_y+250 then
points[i][2]=points[i][2]+2
end
if coords[i][2]>dist_y-250 then
points[i][2]=points[i][2]-2
end
if coords[i][3]<-dist_z+250 then
points[i][3]=points[i][3]+2
end
if coords[i][3]>dist_z-250 then
points[i][3]=points[i][3]-2
end
points[i][1]=points[i][1]+math.random(-100,100)/100
points[i][2]=points[i][2]+math.random(-100,100)/100
points[i][3]=points[i][3]+math.random(-100,100)/100
table.insert(c_vertexes,{coords[i][1]+points[i][1],coords[i][2]+points[i][2],coords[i][3]+points[i][3]})
coords[i][1]=coords[i][1]+points[i][1]
coords[i][2]=coords[i][2]+points[i][2]
coords[i][3]=coords[i][3]+points[i][3]
end
end