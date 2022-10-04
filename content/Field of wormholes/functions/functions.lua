function circle_attack(x,y,ang,a)
local r=75fx
local rad1=360fx/fmath.tau()
local ang_r=ang/rad1
local sin_x,cos_y=fmath.sincos(ang_r)
local rx=x+sin_x*r*a
local ry=y+cos_y*r*a
pewpew.new_baf(rx,ry,ang_r,10fx,2100)
end

function circle_attack2(x,y,r,ang,a)
local rad1=180fx/fmath.tau()
local ang_r=ang/rad1
local ang_r1=ang_r-270fx/rad1
local sin_x,cos_y=fmath.sincos(ang_r1)
local rx=x+sin_x*a*cos_y
local ry=y+sin_x*a*cos_y
pewpew.new_baf(rx,ry,ang_r,10fx,2100)
end

