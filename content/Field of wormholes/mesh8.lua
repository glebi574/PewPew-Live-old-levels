c_vertexes = {}
c_segments = {}
c_colors = {}

local index1 = 0
local index2 = 1
local index3 = 2
local index4 = 3
local r2=1
local r3=3

for i1=0,10 do
for i=0,200 do
  local x = math.random(320*(i1-1), 320*(i1))
  local y = math.random(0, 3200)
  local z = math.random(-300,-100)

  table.insert(c_vertexes, {x,y,z})
  table.insert(c_vertexes, {x+1,y+1,z})
  table.insert(c_segments, {index1, index2})
  index1 = index1 + 2
  index2 = index2 + 2

local r1=math.random(1,3)
if r1==1 then c1=0x99ff9966 end
if r1==2 then c1=0x99ffff66 end
if r1==3 then c1=0x9999ff66 end
  
  table.insert(c_colors, c1)
  table.insert(c_colors, c1)
end
end

local i2=#c_vertexes/2

for i=0,#c_vertexes/2-1,1 do
local x1=c_vertexes[r2][1]
local y1=c_vertexes[r2][2]
for i=0,i2,1 do
if c_vertexes[r3]~=nil then
local x2=c_vertexes[r3][1]
local y2=c_vertexes[r3][2]
if math.abs(x1-x2)<100 and math.abs(y1-y2)<100 then
table.insert(c_segments,{r2-1,r3-1})
end
end
r3=r3+2
end
i2=i2-1
r2=r2+2
r3=r2+2
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}