c_vertexes={}
c_colors={}
c_segments={}
c_segments_p={}

table.insert(c_vertexes,{0,0})

local magic_number=25
local mn2=75
local fk=2*math.pi
local r1=100
local r2=150
local index1 = 1
local segm =fk/magic_number
local segm2=fk/2/mn2

for i=1,mn2 do
local z=math.tan(segm2*i)*r2
for n=1,magic_number do
x=math.tan(segm*n)*r1*math.cos(segm2*i)/4
y=math.cos(segm*n)*r1*math.cos(segm2*i)*4
  table.insert(c_vertexes, {x,y,z})
  table.insert(c_segments_p,n, index1)
  index1 = index1 + 1
  
local c1=0xff66ff55
table.insert(c_colors, c1)
end

table.insert(c_segments_p,magic_number+1,index1-magic_number)
local c1=0xff66ff55
table.insert(c_colors, c1)
table.insert(c_segments,i,{})
for k=1,magic_number+1 do table.insert(c_segments[i],k,c_segments_p[k]) end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}
