c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local mn2=50
local maxn=50
local dx=1
local index1 = 0
local c1=0xffaa00ff
local fk=2*math.pi
local r=900
local segm1 =fk/mn1
local segm2 =fk/mn2/2

for k=0,maxn,0.1 do
n=126*k
local x=math.sin(n*segm1)*r*math.sin(k*segm2)
local y=math.cos(n*segm1)*r*math.sin(k*segm2)
table.insert(c_vertexes,{x,y})
table.insert(c_colors,c1)
table.insert(c_segments,{index1,index1+1})
index1=index1+1
end

table.remove(c_segments,500)
table.insert(c_segments,{index1-1,0})

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}