c_vertexes={}
c_colors={}
c_segments={}

local id=0

local l=2400
local h=1600

local db=50
local s=40
local ln=6
local n=80

local num1=math.floor((l-db*2)/(s+n))
local num2=math.floor((h-db*2)/(s+n))

function r_color(r, g, b, a)
	local color = r * 256 + g
	color = color * 256 + b
	color = color * 256 + a
	return color
end

function count_color(var)
	if math.random(0,1)==1 then var=r_color(math.random(110,199),math.random(0,49),11,math.random(99,199))
	else var=r_color(math.random(0,49),math.random(110,199),11,math.random(99,199)) end
	return var
end

function change(color)
table.insert(c_segments,{id,id+1,id+2,id+3,id})
id=id+4
for j=1,4 do table.insert(c_colors,color) end
end

for k1=0,num1-1 do
for k2=1,ln*2-1 do

if math.random(0,5)<=2 then

for k3=1,4 do

local color
color=count_color(color)
local x=db+s/2+(n+s)*k1

table.insert(c_vertexes,{x+(k2%2)*(n+s)/2,0,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n/2,0,(-ln+k2)*n/2-n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n,0,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n/2,0,(-ln+k2)*n/2+n/2+(k2-1)*s})
change(color)

end end end end

for k1=0,num2-1 do
for k2=1,ln*2-1 do

if math.random(0,5)<=2 then

for k3=1,4 do

local color
color=count_color(color)
local x=db+s/2+(n+s)*k1

table.insert(c_vertexes,{l,x+(k2%2)*(n+s)/2,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{l,x+(k2%2)*(n+s)/2+n/2,(-ln+k2)*n/2-n/2+(k2-1)*s})
table.insert(c_vertexes,{l,x+(k2%2)*(n+s)/2+n,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{l,x+(k2%2)*(n+s)/2+n/2,(-ln+k2)*n/2+n/2+(k2-1)*s})
change(color)

end end end end

for k1=num1-1,0,-1 do
for k2=1,ln*2-1 do

if math.random(0,5)<=2 then

for k3=1,4 do

local color
color=count_color(color)
local x=db+s/2+(n+s)*k1

table.insert(c_vertexes,{x+(k2%2)*(n+s)/2,h,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n/2,h,(-ln+k2)*n/2-n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n,h,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{x+(k2%2)*(n+s)/2+n/2,h,(-ln+k2)*n/2+n/2+(k2-1)*s})
change(color)

end end end end

for k1=num2-1,0,-1 do
for k2=1,ln*2-1 do

if math.random(0,5)<=2 then

for k3=1,4 do

local color
color=count_color(color)
local x=db+s/2+(n+s)*k1

table.insert(c_vertexes,{0,x+(k2%2)*(n+s)/2,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{0,x+(k2%2)*(n+s)/2+n/2,(-ln+k2)*n/2-n/2+(k2-1)*s})
table.insert(c_vertexes,{0,x+(k2%2)*(n+s)/2+n,(-ln+k2)*n/2+(k2-1)*s})
table.insert(c_vertexes,{0,x+(k2%2)*(n+s)/2+n/2,(-ln+k2)*n/2+n/2+(k2-1)*s})
change(color)

end end end end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}