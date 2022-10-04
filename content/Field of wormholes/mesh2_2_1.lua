c_vertexes = {}
c_segments = {}
c_colors = {}

local index1 = 0
local index2 = 1
local index3 = 2
local index4 = 3

for i=0,4000 do
  local x = math.random(0, 3200)
  local y = math.random(0, 3200)
  local z = math.random(100,900)

  table.insert(c_vertexes, {x,y,z})
  table.insert(c_vertexes, {x+1,y+1,z})
  table.insert(c_segments, {index1, index2})
  index1 = index1 + 2
  index2 = index2 + 2

local r1=math.random(1,3)
if r1==1 then c1=0xffffffff end
if r1==2 then c1=0xff9999ff end
if r1==3 then c1=0xffcc99ff end
  
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
end


meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}