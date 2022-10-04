function create_zone(x,y,size)
local x1=x-size/2fx
local x2=x+size/2fx
local y1=y-size/2fx
local y2=y+size/2fx
local arr0={x1,x2,y1,y2,0,false} --phase(0 - not started, 1 - in process, 2 - completed); if contains danger
return arr0
end

function what_zone(x,y,level)
local num
for i=1,#level do
local x1=level[i][1]
local x2=level[i][2]
local y1=level[i][3]
local y2=level[i][4]
if x>x1 and x<x2 and y>y1 and y<y2 then
num=i
break
end
end
return num
end

function zones(x,y,sx,sy,level)
local if_in_zone=false
for i=1,#level do
local x1=level[i][1]
local x2=level[i][2]
local y1=level[i][3]
local y2=level[i][4]
if x>x1 and x<x2 and y>y1 and y<y2 then
if_in_zone=true
end
end
if if_in_zone then
return x,y
else
return sx,sy
end
end

function zones_local(x,y,sx,sy,level)
local if_in_zone=false
for i=1,#level do
local x1=level[1]
local x2=level[2]
local y1=level[3]
local y2=level[4]
if x>x1 and x<x2 and y>y1 and y<y2 then
if_in_zone=true
end
end
if if_in_zone then
return x,y
else
return sx,sy
end
end

function zone_activation(level,zone,x,y,if_in_battle)
local do_action=false
  if level[zone][5]==0 then
   do_action=true
   if_in_battle=true
   level[zone][5]=1
   local x1=level[zone][1]+500fx
   local y1=level[zone][3]+500fx
   if fmath.abs_fixedpoint(x-x1)>fmath.abs_fixedpoint(y-y1) then
    if x>x1 then x=x-10fx else x=x+10fx end
    else
    if y>y1 then y=y-10fx else y=y+10fx end
   end
  end
return level,x,y,if_in_battle,do_action
end

