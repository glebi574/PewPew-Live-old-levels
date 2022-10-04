c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local index1 = 0
local c1=0xffaa00ff
local fk=2*math.pi
local r=900
local segm1 =fk/mn1

for k=0,mn1,0.1 do
n=math.sin(k)
local x=math.sin(k*segm1)*r*n
local y=math.cos(k*segm1)*r*n
table.insert(c_vertexes,{x,y})
table.insert(c_colors,c1)
table.insert(c_segments,{index1,index1+1})
index1=index1+1
end

table.remove(c_segments,500)
table.insert(c_segments,{0,499})

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}