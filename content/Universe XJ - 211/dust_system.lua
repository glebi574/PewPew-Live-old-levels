c_vertexes={}
c_colors={}
c_segments={}

local magic_number=25
local mn2=100
local r1=250
local r2=100
local index1 = 0
local index2 = 1
local fk=2*math.pi
local segm =fk/magic_number
local segm2=fk/2/mn2

for i=1,mn2 do
local z=math.sin(segm2*i)*r2
for n=1,magic_number do
local x=math.cos(segm*n)*r1*math.sin(segm2*i)
local y=math.sin(segm*n)*r1*math.sin(segm2*i)
z=z+math.random(-1*mn2/10,mn2/10)
x=10*math.tan(x)
y=10*math.tan(y)
local n=math.random(1,10)/10
  table.insert(c_vertexes, {x,y,5*z})
  table.insert(c_vertexes, {x+n,y+n,5*z+n})
  table.insert(c_segments, {index1,index2})
  index1 = index1 + 2
  index2 = index2 + 2

local c1
local c2=math.random(1,5)
if c2==1 then c1=0xff66ff99 end
if c2==2 then c1=0xff009999 end
if c2==3 then c1=0x9933ff99 end
if c2==4 then c1=0x9999ff99 end
if c2==5 then c1=0x9900cc99 end
table.insert(c_colors, c1)
local c2=math.random(1,5)
if c2==1 then c1=0xff66ff99 end
if c2==2 then c1=0xff009999 end
if c2==3 then c1=0x9933ff99 end
if c2==4 then c1=0x9999ff99 end
if c2==5 then c1=0x9900cc99 end
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
