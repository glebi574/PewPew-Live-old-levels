c_vertexes = {}
c_segments = {}
c_colors = {}

local index1 = 0
local index2 = 1
local index3 = 2
local index4 = 3
local r2=1
local r3=3

for i1=0,3 do
if i1==0 then
x1=-25
x2=25
y1=-25
y2=6025
end
if i1==1 then
x1=5975
x2=6025
y1=-25
y2=6025
end
if i1==2 then
x1=-25
x2=6025
y1=-25
y2=25
end
if i1==3 then
x1=-25
x2=6025
y1=5975
y2=6025
end
for i=0,400 do
  local x = math.random(x1,x2)
  local y = math.random(y1,y2)
  local z = math.random(-100,100)

  table.insert(c_vertexes, {x,y,z})
  table.insert(c_vertexes, {x+1,y+1,z})
  table.insert(c_segments, {index1, index2})
  index1 = index1 + 2
  index2 = index2 + 2

c1=0xff660066
  
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