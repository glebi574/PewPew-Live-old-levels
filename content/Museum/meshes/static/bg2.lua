c_vertexes={}
c_colors={}
c_segments={}

local mn1=40
local mn2=40
local n1=6
local f1=1
local a=40
local b=40
local index=0
local fk=math.pi*2
local segm1 =fk/mn1
local segm2 =fk/mn2

function a_color(re, gr, bl, al)
  local color = re * 256 + gr
  color = color * 256 + bl
  color = color * 256 + al
  return color
end

for k=1,mn1 do
local x0=-mn2*a/2+(k-1)*a
for i=1,mn2 do
local y0=-mn1*b/2+(i-1)*b
local x=x0+a/2
local y=y0+b/2
if i%2==0 then f1=-f1 end
local z
if f1==1 then z=50 else z=-50 end
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,a_color(49,i*n1,k*n1,249))
if i~=mn2 then table.insert(c_segments,{index,index+1}) end
index=index+1
end
if k~=mn1 then
for f=0,mn2-1 do
table.insert(c_segments,{index+f-mn2,index+f})
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