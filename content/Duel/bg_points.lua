c_vertexes={}
c_colors={}
c_segments={}

local x=2000
local y=2000
local z=500
local amount=1000
local index=0

for i=1,amount do
local px=math.random(-x,x)
local py=math.random(-y,y)
local pz=math.random(-z,z)
table.insert(c_vertexes,{px,py,pz-5})
table.insert(c_vertexes,{px,py,pz+5})
table.insert(c_segments,{index,index+1})
index=index+2
table.insert(c_colors,0xffffff55)
table.insert(c_colors,0xffffff55)
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}