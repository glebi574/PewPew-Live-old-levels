local c_vertexes={}
local c_segments={}
meshes={}

local p1=5000
local entities=3
local dist_x=1000
local dist_y=1000
local dist_z=1000

local points={}
local coords={}

while entities>0 do
local x=math.random(-dist_x+100,dist_x-100)
local y=math.random(-dist_y+100,dist_y-100)
local z=math.random(-dist_z+100,dist_z-100)
local vect_x=math.random(-1000,1000)/100
local vect_y=math.random(-1000,1000)/100
local vect_z=math.random(-1000,1000)/100
table.insert(c_vertexes,{x,y,z})
table.insert(points,{vect_x,vect_y,vect_z})
table.insert(coords,{x,y,z})
entities=entities-1
end

entities=3

table.insert(c_segments,{0,1,2,0})

for phase=1,p1 do
table.insert(meshes,{vertexes = c_vertexes,segments = c_segments})
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