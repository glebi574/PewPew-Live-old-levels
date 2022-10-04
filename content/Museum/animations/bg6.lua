local c_vertexes={}
local c_colors={}
local c_segments={}
meshes={}

local p1=1500
local entities=1
local steps=10
local index=0
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
local segm={}
for i=1,steps do
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,c1)
table.insert(segm,index)
index=index+1
end
table.insert(c_segments,segm)
entities=entities-1
table.insert(points,{vect_x,vect_y,vect_z})
table.insert(coords,{{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z},{x,y,z}})
end

entities=1

for phase=1,p1 do
table.insert(meshes,{vertexes = c_vertexes,segments = c_segments,colors = c_colors})
c_vertexes={}
for i=1,entities do
if coords[i][1][1]<-dist_x+250 then
points[i][1]=points[i][1]+2
end
if coords[i][1][1]>dist_x-250 then
points[i][1]=points[i][1]-2
end
if coords[i][1][2]<-dist_y+250 then
points[i][2]=points[i][2]+2
end
if coords[i][1][2]>dist_y-250 then
points[i][2]=points[i][2]-2
end
if coords[i][1][3]<-dist_z+250 then
points[i][3]=points[i][3]+2
end
if coords[i][1][3]>dist_z-250 then
points[i][3]=points[i][3]-2
end
for k=1,steps do
points[i][1]=points[i][1]+math.random(-100,100)/100
points[i][2]=points[i][2]+math.random(-100,100)/100
points[i][3]=points[i][3]+math.random(-100,100)/100
table.insert(c_vertexes,{coords[i][k][1]+points[i][1],coords[i][k][2]+points[i][2],coords[i][k][3]+points[i][3]})
end
for m=2,steps do
table.insert(c_vertexes,coords[i][m])
end
for m=steps,2,-1 do
for k=1,3 do
coords[i][m][k]=coords[i][m-1][k]
end
end
coords[i][1][1]=coords[i][1][1]+points[i][1]
coords[i][1][2]=coords[i][1][2]+points[i][2]
coords[i][1][3]=coords[i][1][3]+points[i][3]
end
end