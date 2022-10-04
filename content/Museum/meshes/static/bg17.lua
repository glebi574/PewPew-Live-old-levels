c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local maxn=50
local dx=1
local i=0
local index1 = 0
local c1=0xffaa00ff
local fk=2*math.pi
local r=900
local segm1 =fk/mn1
local m0=fk/maxn/2

for k=0,maxn,0.1 do
n=math.sin(k)*2
local x=math.sin(n*math.cos(k*segm1))*r
local y=math.sin(n*math.sin(k*segm1))*r
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