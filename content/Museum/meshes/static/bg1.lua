c_vertexes={}
c_colors={}
c_segments={}

local mn1=20
local mn2=20
local a=100
local b=100
local rads=2*math.pi
local z=math.random(-100,100)
local c1=0x5500ffff

for k=1,mn2 do
local x0=-mn2*a/2+(k-1)*a
for i=1,mn1 do
local y0=-mn1*b/2+(i-1)*b
local v1=math.random(a/10,a*9/10)
local v2=math.random(b/10,b*9/10)
local v3=math.random(-300,300)

table.insert(c_vertexes,{x0+v1,y0+v2,v3})
table.insert(c_vertexes,{x0,y0,z})
table.insert(c_vertexes,{x0,y0+b,z})
table.insert(c_vertexes,{x0+a,y0+b,z})
table.insert(c_vertexes,{x0+a,y0,z})
table.insert(c_vertexes,{x0,y0+b/2,z})
table.insert(c_vertexes,{x0+a/2,y0+b,z})
table.insert(c_vertexes,{x0+a,y0+b/2,z})
table.insert(c_vertexes,{x0+a/2,y0,z})
local num1=#c_vertexes-9
table.insert(c_colors,0x00ff00ff)
for n=1,8 do
table.insert(c_segments,{num1,num1+n})
table.insert(c_colors,c1)
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