c_vertexes={}
c_colors={}
c_segments={}

local mn2=4
local mn1=8
local fk=2*math.pi
local r1=14
local r2=14
local r3=14
local index1 = 0
local c1=0x31f131f1
local segm1 =fk/mn1
local segm2 =fk/mn2/2
local n1=fk/mn1/2

for k=0,mn2 do
local z=r3*math.cos(k*segm2)
for i=1,mn1 do
local x,y
if k%2==0 then
x=math.sin((i)*segm1)*r1*math.sin(k*segm2)
y=math.cos((i)*segm1)*r2*math.sin(k*segm2)
else
x=math.sin((i)*segm1)*r1*math.sin(k*segm2)
y=math.cos((i)*segm1)*r2*math.sin(k*segm2)
end
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,c1)
index1=index1+1
end

end

index1=0

for k=1,mn2 do

for i=1,mn1/2 do
if k%2==0 then
table.insert(c_segments,{index1+1,index1+mn1})
if (index1+mn1+2)%mn1>1 then table.insert(c_segments,{index1+1,index1+mn1+2}) else table.insert(c_segments,{index1+1,index1+2}) end
index1=index1+2
else
if (index1+mn1-1)%mn1<mn1-1 then table.insert(c_segments,{index1,index1+mn1-1}) else table.insert(c_segments,{index1,index1+2*mn1-1}) end
table.insert(c_segments,{index1,index1+mn1+1})
index1=index1+2
end
end

end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}