c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local mn2=50
local n1=5
local a=25
local b=25
local index=0
local fk=math.pi*12
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
local x=math.random(x0+math.floor(a/10),x0+math.floor(a*9/10))
local y=math.random(y0+math.floor(b/10),y0+math.floor(b*9/10))
local z=100*math.sin(segm1*k)*math.sin(segm2*i)
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,a_color(k*n1,0,i*n1,199))
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