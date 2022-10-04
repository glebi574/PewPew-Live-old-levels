c_vertexes={}
c_colors={}
c_segments={}

local c1=0xffaa00ff
local index1 = 0
local index2 = 1
local index3 = 2
local index4 = 3
local index5 = 4
local index6 = 5
local k=150

for i=0,14 do
if (i-1)%2==0 then k=k-300 end
for n=0,3 do
  local z=math.random(0,250)
  table.insert(c_vertexes, {-100+n*300+i*150+k-500,0+i*87-500,z})
  table.insert(c_vertexes, {-50+n*300+i*150+k-500,87+i*87-500,z})
  table.insert(c_vertexes, {50+n*300+i*150+k-500,87+i*87-500,z})
  table.insert(c_vertexes, {100+n*300+i*150+k-500,0+i*87-500,z})
  table.insert(c_vertexes, {50+n*300+i*150+k-500,-87+i*87-500,z})
  table.insert(c_vertexes, {-50+n*300+i*150+k-500,-87+i*87-500,z})
  table.insert(c_segments, {index1,index2,index3,index4,index5,index6,index1})
  index1 = index1 + 6
  index2 = index2 + 6
  index3 = index3 + 6
  index4 = index4 + 6
  index5 = index5 + 6
  index6 = index6 + 6
  
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)

end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}