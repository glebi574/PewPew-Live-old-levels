c_vertexes={}
c_colors={}
c_segments={}
meshes={}

local coords={}
local p1=200

local x1=100
local y1=100
local z1=100
local c1=0xffffffff

table.insert(c_vertexes,{x1,y1,z1})
table.insert(c_vertexes,{x1,-y1,z1})
table.insert(c_vertexes,{-x1,-y1,z1})
table.insert(c_vertexes,{-x1,y1,z1})
table.insert(c_vertexes,{x1,y1,-z1})
table.insert(c_vertexes,{x1,-y1,-z1})
table.insert(c_vertexes,{-x1,-y1,-z1})
table.insert(c_vertexes,{-x1,y1,-z1})
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_segments,{0,1,2,3,0})
table.insert(c_segments,{4,5,6,7,4})
table.insert(c_segments,{0,4})
table.insert(c_segments,{1,5})
table.insert(c_segments,{2,6})
table.insert(c_segments,{3,7})
local x1=x1/2
local y1=y1/2
local z1=z1/2
table.insert(c_vertexes,{x1,y1,z1})
table.insert(c_vertexes,{x1,-y1,z1})
table.insert(c_vertexes,{-x1,-y1,z1})
table.insert(c_vertexes,{-x1,y1,z1})
table.insert(c_vertexes,{x1,y1,-z1})
table.insert(c_vertexes,{x1,-y1,-z1})
table.insert(c_vertexes,{-x1,-y1,-z1})
table.insert(c_vertexes,{-x1,y1,-z1})
table.insert(coords,{x1,y1,z1})
table.insert(coords,{x1,-y1,z1})
table.insert(coords,{-x1,-y1,z1})
table.insert(coords,{-x1,y1,z1})
table.insert(coords,{x1,y1,-z1})
table.insert(coords,{x1,-y1,-z1})
table.insert(coords,{-x1,-y1,-z1})
table.insert(coords,{-x1,y1,-z1})
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

local dx=x1/p1*2
local dy=y1/p1*2
local dz=z1/p1*2
local x1=x1*2
local y1=y1*2
local z1=z1*2

for phase=1,p1 do
c_vertexes={}
table.insert(c_vertexes,{x1,y1,z1})
table.insert(c_vertexes,{x1,-y1,z1})
table.insert(c_vertexes,{-x1,-y1,z1})
table.insert(c_vertexes,{-x1,y1,z1})
table.insert(c_vertexes,{x1,y1,-z1})
table.insert(c_vertexes,{x1,-y1,-z1})
table.insert(c_vertexes,{-x1,-y1,-z1})
table.insert(c_vertexes,{-x1,y1,-z1})
for n=1,#coords do
local x0=coords[n][1]
local y0=coords[n][2]
local z0=coords[n][3]
if x0>0 then x0=x0+dx else x0=x0-dx end
if y0>0 then y0=y0+dy else y0=y0-dy end
if z0>0 then z0=z0+dz else z0=z0-dz end
table.insert(c_vertexes,{x0,y0,z0})
coords[n]={x0,y0,z0}
end

table.insert(meshes,{vertexes = c_vertexes,segments = c_segments,colors = c_colors})
end