c_vertexes={}
c_colors={}
c_segments={}

local amount=10
local amount_z=10
local dz=50
local index=0
local l_index=0
local x=2000
local y=1000

local vect={}

function a_color(re, gr, bl, al)
  local color = re * 256 + gr
  color = color * 256 + bl
  color = color * 256 + al
  return color
end

for i=1,amount do
local dx=math.random(-1000,1000)/500
local dy=0
local rx=dx*4
local ry=y/amount*i
table.insert(c_vertexes,{rx,ry})
table.insert(c_segments,{index,index+1})
table.insert(vect,{rx,ry,dx,dy})
table.insert(c_colors,0xccccccaa)
index = index+1
end
for i=1,amount do
local dy=math.random(-1000,1000)/500
local dx=0
local rx=x/amount*i
local ry=y+dy*4
table.insert(c_vertexes,{rx,ry})
table.insert(c_segments,{index,index+1})
table.insert(vect,{rx,ry,dx,dy})
table.insert(c_colors,0xccccccaa)
index = index+1
end
for i=1,amount do
local dx=math.random(-1000,1000)/500
local dy=0
local rx=x+dx*4
local ry=y-y/amount*i
table.insert(c_vertexes,{rx,ry})
table.insert(c_segments,{index,index+1})
table.insert(vect,{rx,ry,dx,dy})
table.insert(c_colors,0xccccccaa)
index = index+1
end
for i=1,amount do
local dy=math.random(-1000,1000)/500
local dx=0
local rx=x-x/amount*i
local ry=dy*4
table.insert(c_vertexes,{rx,ry})
if i~=amount then table.insert(c_segments,{index,index+1}) else table.insert(c_segments,{index,0}) end
table.insert(vect,{rx,ry,dx,dy})
table.insert(c_colors,0xccccccaa)
index = index+1
end

local vect_n={}

for i=1,#vect do
table.insert(vect_n,vect[i])
end

l_index=index

for part=1,2 do
dz=-dz
for l=1,amount_z do

for i=1,#vect do
local rx=vect[i][1]+vect[i][3]
local ry=vect[i][2]+vect[i][4]
if vect[i][3]~=0 then vect[i][3]=vect[i][3]+math.random(-1000,1000)/500 end
if vect[i][4]~=0 then vect[i][4]=vect[i][4]+math.random(-1000,1000)/500 end
local rz=dz*l
table.insert(c_vertexes,{rx,ry,rz})
if i~=#vect then table.insert(c_segments,{index,index+1}) else table.insert(c_segments,{index,l_index}) end
table.insert(c_colors,a_color(219,219,219,149-math.floor(149/amount_z*l)))
index=index+1
end

l_index=index
end

vect={}
for i=1,#vect_n do
table.insert(vect,vect_n[i])
end

end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}