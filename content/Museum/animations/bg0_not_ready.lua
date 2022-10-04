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
local num=tau/p1
local num1=num*p1/8
local num2=num*p1/8*3
local num3=num*p1/8*5
local num4=num*p1/8*7

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
local x2=x1
local y2=y1
local z2=z1
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
for i=1,2 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num2/2)+1),
coords[i][2]*(math.sin(num2)),
coords[i][3]+coords[i][3]*(math.sin(num2/2)+1)})
end
for i=3,4 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num3/2)+1),
coords[i][2]*(math.sin(num3)),
coords[i][3]+coords[i][3]*(math.sin(num3/2)+1)})
end
for i=5,6 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num2/2)+1),
coords[i][2]*(math.sin(num2)),
coords[i][3]+coords[i][3]*(math.sin(num2/2)+1)})
end
for i=7,8 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num3/2)+1),
coords[i][2]*(math.sin(num3)),
coords[i][3]+coords[i][3]*(math.sin(num3/2)+1)})
end
for i=9,10 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num1/2)+1),
coords[i][2]*(math.sin(num1)),
coords[i][3]+coords[i][3]*(math.sin(num1/2)+1)})
end
for i=11,12 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num4/2)+1),
coords[i][2]*(math.sin(num4)),
coords[i][3]+coords[i][3]*(math.sin(num4/2)+1)})
end
for i=13,14 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num1/2)+1),
coords[i][2]*(math.sin(num1)),
coords[i][3]+coords[i][3]*(math.sin(num1/2)+1)})
end
for i=15,16 do
table.insert(c_vertexes,
{coords[i][1]+coords[i][1]*(math.sin(num4/2)+1),
coords[i][2]*(math.sin(num4)),
coords[i][3]+coords[i][3]*(math.sin(num4/2)+1)})
end
num1=num1+num
num2=num2+num
num3=num3+num
num4=num4+num
end