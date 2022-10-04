local shield_box = require("/dynamic/helpers/boxes/shield_box.lua")
local cannon_box = require("/dynamic/helpers/boxes/cannon_box.lua")
local functions = require("/dynamic/functions/functions.lua")
pewpew.set_level_size(600fx, 600fx)

local background = pewpew.new_customizable_entity(0fx, 0fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)
local graphics = pewpew.new_customizable_entity(-1400fx, -1400fx)
pewpew.customizable_entity_set_mesh(graphics, "/dynamic/figures1.lua", 0)

ship_id=pewpew.new_player_ship(300fx,300fx,0)
pewpew.configure_player(0, {shield = 5})
local weapon_config={ frequency = pewpew.CannonFrequency.FREQ_7_5, cannon = pewpew.CannonType.TRIPLE}
pewpew.configure_player_ship_weapon(ship_id, weapon_config)

local endgamenn1=0
local time = 0
local timer1=0
local timer2=0
local ph1=0
local ship_id1=0
local ship_id2=0
local ship_id3=0

function level_tick()
  local conf = pewpew.get_player_configuration(0)
  if conf["has_lost"] == true then
  endgamenn1=1
  if pewpew.entity_get_is_alive(ship_id) then pewpew.entity_destroy(ship_id) end
  if pewpew.entity_get_is_alive(ship_id1) then pewpew.entity_destroy(ship_id1) end
  if pewpew.entity_get_is_alive(ship_id2) then pewpew.entity_destroy(ship_id2) end
  if pewpew.entity_get_is_alive(ship_id3) then pewpew.entity_destroy(ship_id3) end
  pewpew.stop_game()
  end
if endgamenn1==0 then
if ph1==0 then
if timer1==10 then
local ang1=fmath.random_fixedpoint(0fx,359fx)
local nn1=fmath.random_int(1,4)
if nn1==1 then
wave(9fx,10fx,10fx,590fx,ang1,-1,7fx,7)
timer1=0
end
if nn1==2 then
wave(590fx,591fx,10fx,590fx,ang1,-1,7fx,7)
timer1=0
end
if nn1==3 then
wave(10fx,590fx,9fx,10fx,ang1,-1,7fx,7)
timer1=0
end
if nn1==4 then
wave(10fx,590fx,590fx,591fx,ang1,-1,7fx,7)
timer1=0
end
end
if timer2>300 then
local xn1=fmath.random_fixedpoint(0fx,600fx)
local yn1=fmath.random_fixedpoint(0fx,600fx)
shield_box.new(xn1,yn1,weapon_config)
timer2=0
end
if pewpew.get_score_of_player(0)>10000 then ph1=1 end
end
if ph1==1 then
pewpew.set_level_size(600fx,1300fx)
local background = pewpew.new_customizable_entity(0fx, 700fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)
local x1,y1=pewpew.entity_get_position(ship_id)
ship_id1=pewpew.new_player_ship(x1,y1+600fx,0)
pewpew.configure_player_ship_weapon(ship_id1, weapon_config)
pewpew.configure_player(0,{camera_distance=-2000fx})
ph1=2
timer1=0
timer2=0
end
if ph1==2 then
if timer1==9 then
local ang1=fmath.random_fixedpoint(0fx,359fx)
local nn1=fmath.random_int(1,4)
if nn1==1 then
wave(9fx,10fx,10fx,1290fx,ang1,-1,7fx,9)
timer1=0
end
if nn1==2 then
wave(590fx,591fx,10fx,1290fx,ang1,-1,7fx,9)
timer1=0
end
if nn1==3 then
wave(10fx,590fx,9fx,10fx,ang1,-1,7fx,9)
timer1=0
end
if nn1==4 then
wave(10fx,590fx,1290fx,1291fx,ang1,-1,7fx,9)
timer1=0
end
if timer2>300 then
local nn1=fmath.random_int(1,2)
if nn1==1 then
local xn1=fmath.random_fixedpoint(0fx,600fx)
local yn1=fmath.random_fixedpoint(0fx,600fx)
shield_box.new(xn1,yn1,weapon_config)
timer2=0
end
if nn1==2 then
local xn1=fmath.random_fixedpoint(0fx,600fx)
local yn1=fmath.random_fixedpoint(700fx,1300fx)
shield_box.new(xn1,yn1,weapon_config)
timer2=0
end
end
end
if pewpew.get_score_of_player(0)>25000 then ph1=3 end
end
if ph1==3 then
pewpew.set_level_size(1300fx,1300fx)
local background = pewpew.new_customizable_entity(700fx, 700fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)
local background = pewpew.new_customizable_entity(700fx, 0fx)
pewpew.customizable_entity_set_mesh(background, "/dynamic/levelborders.lua", 0)
local x1,y1=pewpew.entity_get_position(ship_id)
ship_id2=pewpew.new_player_ship(x1+600fx,y1+600fx,0)
pewpew.configure_player_ship_weapon(ship_id2, weapon_config)
ship_id3=pewpew.new_player_ship(x1+600fx,y1,0)
pewpew.configure_player_ship_weapon(ship_id3, weapon_config)
ph1=4
timer1=0
timer2=0
local weapon_config1={ frequency = pewpew.CannonFrequency.FREQ_6, cannon = pewpew.CannonType.TRIPLE}
pewpew.configure_player_ship_weapon(ship_id,weapon_config1)
pewpew.configure_player_ship_weapon(ship_id1,weapon_config1)
pewpew.configure_player_ship_weapon(ship_id2,weapon_config1)
pewpew.configure_player_ship_weapon(ship_id3,weapon_config1)
end
if ph1==4 then
if timer1==9 then
local ang1=fmath.random_fixedpoint(0fx,359fx)
local nn1=fmath.random_int(1,4)
if nn1==1 then
wave(9fx,10fx,10fx,1290fx,ang1,-1,7fx,11)
timer1=0
end
if nn1==2 then
wave(1290fx,1291fx,10fx,1290fx,ang1,-1,7fx,11)
timer1=0
end
if nn1==3 then
wave(10fx,1290fx,9fx,10fx,ang1,-1,7fx,11)
timer1=0
end
if nn1==4 then
wave(10fx,1290fx,1290fx,1291fx,ang1,-1,7fx,11)
timer1=0
end
if timer2>300 then
local nn1=fmath.random_int(1,4)
if nn1==1 then
local xn1=fmath.random_fixedpoint(0fx,600fx)
local yn1=fmath.random_fixedpoint(0fx,600fx)
shield_box.new(xn1,yn1,weapon_config1)
timer2=0
end
if nn1==2 then
local xn1=fmath.random_fixedpoint(0fx,600fx)
local yn1=fmath.random_fixedpoint(700fx,1300fx)
shield_box.new(xn1,yn1,weapon_config1)
timer2=0
end
if nn1==3 then
local xn1=fmath.random_fixedpoint(700fx,1300fx)
local yn1=fmath.random_fixedpoint(700fx,1300fx)
shield_box.new(xn1,yn1,weapon_config1)
timer2=0
end
if nn1==4 then
local xn1=fmath.random_fixedpoint(700fx,1300fx)
local yn1=fmath.random_fixedpoint(0fx,600fx)
shield_box.new(xn1,yn1,weapon_config1)
timer2=0
end
end
end
end
local x1,y1=pewpew.entity_get_position(ship_id)
if ph1>1 then pewpew.entity_set_position(ship_id1,x1,y1+700fx) end
if ph1>3 then
pewpew.entity_set_position(ship_id2,x1+700fx,y1+700fx)
pewpew.entity_set_position(ship_id3,x1+700fx,y1)
end
timer1=timer1+1
timer2=timer2+1
if x1>600fx then pewpew.entity_set_position(ship_id,599fx,y1) end
if y1>600fx then pewpew.entity_set_position(ship_id,x1,599fx) end
if (x1>600fx) and (y1>600fx) then pewpew.entity_set_position(ship_id,599fx,599fx) end
end
end

pewpew.add_update_callback(level_tick)