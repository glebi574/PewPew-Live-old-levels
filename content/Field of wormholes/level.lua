local functions = require("/dynamic/functions/functions.lua")
local shield_box = require("/dynamic/helpers/boxes/shield_box.lua")
local cannon_box = require("/dynamic/helpers/boxes/cannon_box.lua")
local lq_box = require("/dynamic/helpers/boxes/lq_box.lua")
local hq_box = require("/dynamic/helpers/boxes/hq_box.lua")
local uq_box = require("/dynamic/helpers/boxes/uq_box.lua")

local width=2000fx
local height=2000fx
pewpew.set_level_size(width,height)

local background = pewpew.new_customizable_entity(0fx, 0fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)

pewpew.configure_player(0, {shield = 3})

ship_id = pewpew.new_player_ship(900fx, 1000fx, 0)
local weapon_config={ frequency = pewpew.CannonFrequency.FREQ_15, cannon = pewpew.CannonType.SINGLE}

pewpew.configure_player_ship_weapon(ship_id, weapon_config)

lq_box.new(800fx,1000fx)
hq_box.new(900fx,1100fx)
uq_box.new(900fx,900fx)

local stop1=0
local ang=0fx
local k=0fx
local timerc=0
local timer1=0
local timer2=0
local timer3=0
local timer4=0
local timer5=0
local rx=1000fx
local ry=1000fx

local wh=pewpew.new_customizable_entity(rx,ry)
pewpew.add_arrow_to_player_ship(ship_id,wh,0xff0000ff)

local time = 0

function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if conf["has_lost"] == true then
  stop1=1
    pewpew.stop_game()
  end
if stop1==0 then
local bafn = pewpew.get_entity_count(pewpew.EntityType.BAF)
if bafn>1000 then
b2=12
b3=64
else
b2=60
b3=128
end
local x2,y2=pewpew.entity_get_position(ship_id)
timer1=timer1+1
timer2=timer2+1
timer3=timer3+1
timer4=timer4+1
timer5=timer5+1
timerc=timerc+1
  if timer2==9 then
  ang=ang-29fx
  timer2=0
  end
  if timer1==2 then
circle_attack(rx,ry,ang,k)
timer1=0
  end
  if timerc==45 then
 pewpew.create_explosion(rx,ry,0xff000fff,2fx,50)
 timerc=0
 end
if (timer3==100) or (timer3==200) or (timer3==300) or (timer3==400) or (timer3==500) or (timer3==600) or (timer3==700) or (timer3==800) or (timer3==900) then
local ang1=0fx
local x1=fmath.random_fixedpoint(10fx,1990fx)
local y1=fmath.random_fixedpoint(10fx,1990fx)
for i=1,b2,1 do
local r=fmath.random_fixedpoint(1fx,50fx)
local k1=fmath.random_fixedpoint(0fx,100fx)
circle_attack2(x1,y1,r,ang1,k1)
ang1=ang1+6fx
end
end
if (timer5==450) or (timer5==900) then
pewpew.entity_destroy(wh)
rx=fmath.random_fixedpoint(100fx,1900fx)
ry=fmath.random_fixedpoint(100fx,1900fx)
wh=pewpew.new_customizable_entity(rx,ry)
pewpew.add_arrow_to_player_ship(ship_id,wh,0xff0000ff)
local x1=fmath.random_fixedpoint(500fx,1500fx)
local y1=fmath.random_fixedpoint(500fx,1500fx)
shield_box.new(x1,y1,weapon_config)
timer5=0
end
if timer3==900 then
if (x2<150fx) or (y2<150fx) or (x2>1850fx) or (y2>1850fx) then
local x3=900fx
local y3=900fx
for i=0,5,1 do
for i=0,5,1 do
pewpew.new_rolling_cube(x3,y3)
y3=y3+50fx
end
x3=x3+50fx
y3=900fx
end
else
local x1=fmath.random_fixedpoint(10fx,1990fx)
local y1=fmath.random_fixedpoint(10fx,1990fx)
local ang1=fmath.random_fixedpoint(0fx,314fx)
pewpew.new_inertiac(x1,y1,1fx,ang1)
pewpew.new_bomb(1000fx,1000fx,pewpew.BombType.ATOMIZE)
end
timer3=0
end
if timer4==1200 then
local rx1=fmath.random_fixedpoint(10fx,1990fx)
local ry1=fmath.random_fixedpoint(10fx,1990fx)
local ang2=0fx
local k1=fmath.random_fixedpoint(-2fx,2fx)
for i=1,b3,1 do
circle_attack(rx1,ry1,ang2,k1)
ang2=ang2+5fx
end
local x1=fmath.random_fixedpoint(10fx,1990fx)
local y1=fmath.random_fixedpoint(10fx,1990fx)
cannon_box.new(x1,y1,2)
timer4=0
end
end

end

pewpew.add_update_callback(level_tick)