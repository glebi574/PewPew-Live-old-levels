local c_vertexes={}
local c_segments={}
meshes={}

local coords={}

local p1=200

local x1=100
local y1=100
local z1=100

local tau=math.pi*2
local index=0
local num1=tau/p1

table.insert(c_vertexes,{x1,y1,z1})
table.insert(c_vertexes,{x1,-y1,z1})
table.insert(c_vertexes,{-x1,-y1,z1})
table.insert(c_vertexes,{-x1,y1,z1})
table.insert(c_vertexes,{x1,y1,-z1})
table.insert(c_vertexes,{x1,-y1,-z1})
table.insert(c_vertexes,{-x1,-y1,-z1})
table.insert(c_vertexes,{-x1,y1,-z1})
table.insert(c_segments,{0,1,2,3,0})
table.insert(c_segments,{4,5,6,7,4})
table.insert(c_segments,{0,4})
table.insert(c_segments,{1,5})
table.insert(c_segments,{2,6})
table.insert(c_segments,{3,7})
local x2=x1/2
local y2=y1/2
local z2=z1/2
table.insert(c_vertexes,{x2,y2,z2})
table.insert(c_vertexes,{x2,-y2,z2})
table.insert(c_vertexes,{-x2,-y2,z2})
table.insert(c_vertexes,{-x2,y2,z2})
table.insert(c_vertexes,{x2,y2,-z2})
table.insert(c_vertexes,{x2,-y2,-z2})
table.insert(c_vertexes,{-x2,-y2,-z2})
table.insert(c_vertexes,{-x2,y2,-z2})
table.insert(c_segments,{8,9,10,11,8})
table.insert(c_segments,{12,13,14,15,12})
table.insert(c_segments,{8,12})
table.insert(c_segments,{9,13})
table.insert(c_segments,{10,14})
table.insert(c_segments,{11,15})
table.insert(c_segments,{0,8})
table.insert(c_segments,{1,9})
table.insert(c_segments,{2,10})
table.insert(c_segments,{3,11})
table.insert(c_segments,{4,12})
table.insert(c_segments,{5,13})
table.insert(c_segments,{6,14})
table.insert(c_segments,{7,15})

for i=1,#c_vertexes do
table.insert(coords,c_vertexes[i])
end

for phase=1,p1 do
table.insert(meshes,{vertexes = c_vertexes,segments = c_segments})
c_vertexes={}
local nsin=math.sin(num1*phase)
local ncos=math.cos(num1*phase)
for i=1,8 do
table.insert(c_vertexes,
{coords[i][1]*nsin*2,
coords[i][2]*ncos/2,
coords[i][3]*ncos/2})
end
for i=9,16 do
table.insert(c_vertexes,
{coords[i][1]*ncos*4,
coords[i][2]*nsin,
coords[i][3]*nsin})
end
end