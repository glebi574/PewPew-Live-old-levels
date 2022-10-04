c_vertexes={}
c_segments={}

local mn1=50
local mn2=25
local fk=2*math.pi
local r1=300
local r2=300
local r3=300
local index1 = 0
local segm1 =fk/mn1
local segm2 =fk/mn2/2

for k=0,mn2 do
local z=r3*math.cos(k*segm2)
for i=1,mn1 do
local x=math.sin(i*segm1+k/fk)*r1*math.sin(k*segm2)
local y=math.cos(i*segm1+k/fk)*r2*math.sin(k*segm2)
table.insert(c_vertexes,{x,y,z})
if i~=mn1 then table.insert(c_segments,{index1,index1+1}) else table.insert(c_segments,{index1,index1+1-mn1}) end
index1=index1+1
end

end

index1= 0

for k=0,mn2-1 do

for i=1,mn1 do
table.insert(c_segments,{index1,index1+mn1})
index1=index1+1
end

end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments
  }
}