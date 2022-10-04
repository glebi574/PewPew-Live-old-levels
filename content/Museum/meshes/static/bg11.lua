c_vertexes={}
c_colors={}
c_segments={}

local mn1=30
local mn2=30
local n1=3
local a=50
local b=50
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
local z=math.sin(segm1*k)*math.sin(segm2*i)*200
table.insert(c_vertexes,{x,y,z})
table.insert(c_colors,a_color(49,i*n1,k*n1,199))
end
end

for n=1,mn1*mn2 do
local x=c_vertexes[n][1]
local y=c_vertexes[n][2]
for m=n+1,mn1*mn2-1 do
local x1=c_vertexes[m][1]
local y1=c_vertexes[m][2]
local rx=x-x1
local ry=y-y1
if rx*rx+ry*ry>10*a*b and rx*rx+ry*ry<20*a*b then
table.insert(c_segments,{n,m})
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