meshes = {}

local fk=2*math.pi
local r1=50
local r2=50
local index1 = 0
local c1=0xffffffff

for mn1=3,12 do
c_vertexes={}
c_colors={}
c_segments={}
local segm =fk/mn1

for k=1,2 do
local z
if k==1 then z=25 else z=-25 end

for i=1,mn1 do
local x=math.cos(i*segm)*r1
local y=math.sin(i*segm)*r2
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,c1)
if i~=mn1 then table.insert(c_segments,{index1,index1+1}) else table.insert(c_segments,{index1,index1+1-mn1}) end
index1=index1+1
end

end

index1= 0

for i=1,mn1 do
table.insert(c_segments,{index1,index1+mn1})
index1=index1+1
end
index1=0
table.insert(meshes,{vertexes = c_vertexes,segments = c_segments,colors = c_colors})
end