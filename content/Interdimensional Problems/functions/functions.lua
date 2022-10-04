function wave(x1,x2,y1,y2,ang,lt,speed,num)
local angr=ang*fmath.tau()/360fx
local x=fmath.abs_fixedpoint(x1-x2)
local y=fmath.abs_fixedpoint(y1-y2)
local xd=x/(fmath.to_fixedpoint(num))
local yd=y/(fmath.to_fixedpoint(num))
if x==0fx then
for i=1,num do
pewpew.new_baf(x1,y,angr,speed,lt)
y=y-yd
end
end
if y==0fx then
for i=1,num do
pewpew.new_baf(x,y1,angr,speed,lt)
x=x-xd
end
end
if (x~=0fx) and (y~=0fx) then
for i=1,num do
local xr=fmath.random_fixedpoint(x1,x2)
local yr=fmath.random_fixedpoint(y1,y2)
pewpew.new_baf(xr,yr,angr,speed,lt)
end
end
end

--lifetime