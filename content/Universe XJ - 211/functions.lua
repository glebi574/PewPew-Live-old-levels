function mesh1(x1,y1,scale,way)
local b1 = pewpew.new_customizable_entity(x1, y1)
pewpew.customizable_entity_set_mesh(b1, way, 0)
pewpew.customizable_entity_set_position_interpolation(b1,true)
pewpew.customizable_entity_set_mesh_scale(b1,scale)
pewpew.customizable_entity_set_visibility_radius(b1,5000fx)
local kk1=fmath.random_int(1,10)
if kk1==1 then pewpew.customizable_entity_set_mesh_color(b1,0x666666ff)  end
if kk1==2 then pewpew.customizable_entity_set_mesh_color(b1,0xff0000ff)  end
if kk1==3 then pewpew.customizable_entity_set_mesh_color(b1,0xff9999ff)  end
if kk1==4 then pewpew.customizable_entity_set_mesh_color(b1,0xff6600ff)  end
if kk1==5 then pewpew.customizable_entity_set_mesh_color(b1,0x00ffffff)  end
if kk1==6 then pewpew.customizable_entity_set_mesh_color(b1,0x9900ccff)  end
if kk1==7 then pewpew.customizable_entity_set_mesh_color(b1,0xffff66ff)  end
if kk1==8 then pewpew.customizable_entity_set_mesh_color(b1,0xffffccff)  end
if kk1==9 then pewpew.customizable_entity_set_mesh_color(b1,0xccffccff)  end
if kk1==10 then pewpew.customizable_entity_set_mesh_color(b1,0x99ccffff) end
return b1
end

function points_system(x1,y1,movings)
local b1 = pewpew.new_customizable_entity(x1, y1)
pewpew.customizable_entity_set_mesh(b1, "/dynamic/dust_system.lua", 0)
pewpew.customizable_entity_set_mesh_scale(b1,fmath.random_fixedpoint(1fx,10fx))
pewpew.customizable_entity_set_visibility_radius(b1,10000fx)
if movings then pewpew.customizable_entity_set_position_interpolation(b1,true) end
pewpew.customizable_entity_set_mesh_angle(b1,fmath.random_fixedpoint(1fx,6fx),fmath.random_fixedpoint(1fx,6fx),fmath.random_fixedpoint(1fx,6fx),fmath.random_fixedpoint(1fx,6fx))
return b1
end

function orbit1(x,y,r,ang,r1,a1,a2,id2)
local rad1=r1/fmath.tau()
local ang_r=ang/rad1
local sin_x,cos_y=fmath.sincos(ang_r)
local rx=x+sin_x*r*a1
local ry=y+cos_y*r*a2
pewpew.entity_set_position(id2,rx,ry)
end

function borders(id1,x0,y0)
if x0<0fx then
pewpew.entity_set_position(id1,99990fx,y0)
end
if x0>100000fx then
pewpew.entity_set_position(id1,10fx,y0)
end
if y0<0fx then
pewpew.entity_set_position(id1,x0,99990fx)
end
if y0>100000fx then
pewpew.entity_set_position(id1,x0,10fx)
end
local x1,y1=pewpew.entity_get_position(id1)
return x1,y1
end

function r_close(px,py,id1,r)
local x0,y0=pewpew.entity_get_position(id1)
local x1=fmath.abs_fixedpoint(px-x0)
local y1=fmath.abs_fixedpoint(py-y0)
if x1*x1+y1*y1<r*r then return true else return false end
end

function movement1(id1,x0,y0,dx,dy)
local ang1,m1,no1,no2=pewpew.get_player_inputs(0)
if m1~=0fx or dx~=0fx or dy~=0fx then
local sin1,cos1=fmath.sincos(ang1)
local dy1=m1*sin1
local dx1=m1*cos1
local rdx=dx+dx1
local rdy=dy+dy1
local rx1=x0+rdx
local ry1=y0+rdy
pewpew.entity_set_position(id1,rx1,ry1)
return rx1,ry1,rdx,rdy
else
pewpew.entity_set_position(id1,x0,y0)
return x0,y0,dx,dy
end
end

function movement2(id1,x0,y0,dx,dy)
if dx~=0fx or dy~=0fx then
local rx1=x0+dx
local ry1=y0+dy
pewpew.entity_set_position(id1,rx1,ry1)
return rx1,ry1
else
pewpew.entity_set_position(id1,x0,y0)
return x0,y0
end
end

function gravitation_point(x0,y0,id_o,dx,dy,r,a)
if r_close(x0,y0,id_o,r) then
local ox,oy=pewpew.entity_get_position(id_o)
local x1=x0-ox
local y1=y0-oy
local rd=fmath.sqrt(x1*x1+y1*y1)
local sin1=y1/rd
local cos1=x1/rd
local dx0=r/rd*a*cos1
local dy0=r/rd*a*sin1
local rdx=dx-dx0
local rdy=dy-dy0
return rdx,rdy
else return dx,dy end
end

function gravitation_point_global(x0,y0,id_o,dx,dy,r,a)
if r_close(x0,y0,id_o,100000fx) then
local ox,oy=pewpew.entity_get_position(id_o)
local x1=x0-ox
local y1=y0-oy
local rd=fmath.sqrt(x1*x1+y1*y1)
local sin1=y1/rd
local cos1=x1/rd
local dx0=r/rd*a*cos1
local dy0=r/rd*a*sin1
local rdx=dx-dx0
local rdy=dy-dy0
return rdx,rdy
else return dx,dy end
end

function gravitation_point_array(id_arr,x0,y0,dx,dy,r,a)
local rdx=dx
local rdy=dy
for i=1,#id_arr do
local id1=id_arr[i]
rdx,rdy=gravitation_point_global(x0,y0,id1,rdx,rdy,r,a)
end
return rdx,rdy
end

function friction1(x1,x2,y1,y2,x0,y0,dx,dy,k)
if x0>x1 and x0<x2 and y0>y1 and y0<y2 then
local rdx=dx*(1fx-k)
local rdy=dy*(1fx-k)
return rdx,rdy
else return dx,dy end
end

function friction2(x0,y0,dx,dy,k)
local rdx=dx*(1fx-k)
local rdy=dy*(1fx-k)
return rdx,rdy
end

function create_snake(mesh_f,mesh_s,main_id,segm,rotato,sx,sy)
local arr1={}
for i=1,segm do
local id1=pewpew.new_customizable_entity(sx,sy)
pewpew.customizable_entity_set_mesh(id1,mesh_f,0)
pewpew.customizable_entity_set_position_interpolation(id1,false)
pewpew.customizable_entity_set_mesh_scale(id1,mesh_s)
pewpew.customizable_entity_set_mesh_angle(id1,rotato,0fx,0fx,1fx)
table.insert(arr1,{main_id,id1,sx,sy,rotato})
end
return arr1
end

function snake_movement(arr1,rotato)
for i=1,#arr1-1 do
arr1[#arr1-i+1][3]=arr1[#arr1-i][3]
arr1[#arr1-i+1][4]=arr1[#arr1-i][4]
arr1[#arr1-i+1][5]=arr1[#arr1-i][5]
pewpew.entity_set_position(arr1[#arr1-i+1][2],arr1[#arr1-i][3],arr1[#arr1-i][4])
pewpew.customizable_entity_set_mesh_angle(arr1[#arr1-i+1][2],arr1[#arr1-i+1][5],0fx,0fx,1fx)
end
local x1,y1=pewpew.entity_get_position(arr1[1][1])
pewpew.entity_set_position(arr1[1][2],x1,y1)
arr1[1][3]=x1
arr1[1][4]=y1
arr1[1][5]=rotato
pewpew.customizable_entity_set_mesh_angle(arr1[1][2],arr1[1][5],0fx,0fx,1fx)
return arr1
end

function control()
local no1,no2,ang1,k1=pewpew.get_player_inputs(0)
local d1
if k1~=0fx then
local rad1=360fx/fmath.tau()
local angr1=ang1*rad1
if (angr1>=0fx) and (angr1<90fx) then
d1=1
end
if (angr1>=90fx) and (angr1<180fx) then
d1=2
end
if (angr1>=180fx) and (angr1<270fx) then
d1=3
end
if (angr1>=270fx) and (angr1<360fx) then
d1=4
end
else d1=0
end
return d1
end

function system1(x0,y0,r_min,r_max,mn1,sc1,sc2)
local d1
local system_array={}
for i=0,mn1 do
local d0=fmath.random_int(0,1)
if d0==0 then d1=1fx else d1=-1fx end
local d2=d1*fmath.random_fixedpoint(450fx,3600fx)
local ang1=(fmath.random_fixedpoint(0fx,360fx))
local dr=(r_max-r_min)/fmath.to_fixedpoint(mn1)
local r2=fmath.random_fixedpoint(r_min+10fx+dr*fmath.to_fixedpoint(i),r_min+dr*(fmath.to_fixedpoint(i)+1fx))
local idd=mesh1(x0,y0,fmath.random_fixedpoint(sc1,sc2),"/dynamic/planet1.lua")
table.insert(system_array,{x0,y0,r2,ang1,d2,idd,d1})
end
return system_array
end

function system2(x0,y0,r_min,r_max,mn1)
local d1
local system_array={}
for i=0,mn1 do
local d0=fmath.random_int(0,1)
if d0==0 then d1=1fx else d1=-1fx end
local d2=d1*fmath.random_fixedpoint(1800fx,3600fx)
local ang1=(fmath.random_fixedpoint(0fx,360fx))
local r2=fmath.random_fixedpoint(r_min,r_max)
local idd=points_system(x0,y0,true)
table.insert(system_array,{x0,y0,r2,ang1,d2,idd,d1})
end
return system_array
end

function system_orbit(arr,n)
for i=0,#arr-1 do
local i1=arr[i+1][1]
local i2=arr[i+1][2]
local i3=arr[i+1][3]
local i4=arr[i+1][4]
local i5=arr[i+1][5]
local i6=arr[i+1][6]
local i7=arr[i+1][7]
if d1==1fx then orbit1(i1,i2,i3,i4+1fx*n,i5,1fx,1fx,i6) else orbit1(i1,i2,i3,i4+1fx*n*(-1fx),i5,1fx,1fx,i6) end
pewpew.customizable_entity_set_mesh_angle(i6,n/360fx+i4*i3/40000fx,n/360fx,n/360fx,n/360fx)
end
end

function create_enemy(enemies_arr,type1,px,py)
local b=fmath.random_int(1,4)
if b==1 or b==2 then k1=fmath.random_fixedpoint(50fx,500fx) else k1=fmath.random_fixedpoint(-500fx,-50fx) end
if b==1 or b==4 then k2=fmath.random_fixedpoint(50fx,500fx) else k2=fmath.random_fixedpoint(-500fx,-50fx) end
local x1=px+k1
local y1=py+k2
local id1=pewpew.new_customizable_entity(x1,y1)
pewpew.customizable_entity_set_mesh(id1,"/dynamic/drone1.lua",type1)
pewpew.customizable_entity_set_mesh_color(id1,0xff0000ff)
pewpew.customizable_entity_set_position_interpolation(id1,true)
table.insert(enemies_arr,{id1,0fx,0fx,x1,y1,40,10})
return enemies_arr
end

function bad_AI(enemies_arr,px,py,n)
for i=1,#enemies_arr do
if enemies_arr[i][6]==40 then enemies_arr[i][6]=0 end
if enemies_arr[i][6]==0 then
local b=fmath.random_int(1,4)
if b==1 or b==2 then k1=fmath.random_fixedpoint(50fx,500fx) else k1=fmath.random_fixedpoint(-500fx,-50fx) end
if b==1 or b==4 then k2=fmath.random_fixedpoint(50fx,500fx) else k2=fmath.random_fixedpoint(-500fx,-50fx) end
local x1=px+k1
local y1=py+k2
local nx,ny=pewpew.entity_get_position(enemies_arr[i][1])
local speedx=fmath.abs_fixedpoint(fmath.abs_fixedpoint(nx)-fmath.abs_fixedpoint(x1))/40fx
local speedy=fmath.abs_fixedpoint(fmath.abs_fixedpoint(ny)-fmath.abs_fixedpoint(y1))/40fx
enemies_arr[i][2]=speedx
enemies_arr[i][3]=speedy
enemies_arr[i][4]=x1
enemies_arr[i][5]=y1
end
local ex,ey=pewpew.entity_get_position(enemies_arr[i][1])
if enemies_arr[i][6]<40 then
if enemies_arr[i][4]>ex and enemies_arr[i][5]>ey then
pewpew.entity_set_position(enemies_arr[i][1],ex+enemies_arr[i][2],ey+enemies_arr[i][3]) goto ended
end
if enemies_arr[i][4]>ex and enemies_arr[i][5]<ey then
pewpew.entity_set_position(enemies_arr[i][1],ex+enemies_arr[i][2],ey-enemies_arr[i][3]) goto ended
end
if enemies_arr[i][4]<ex and enemies_arr[i][5]>ey then
pewpew.entity_set_position(enemies_arr[i][1],ex-enemies_arr[i][2],ey+enemies_arr[i][3]) goto ended
end
if enemies_arr[i][4]<ex and enemies_arr[i][5]<ey then
pewpew.entity_set_position(enemies_arr[i][1],ex-enemies_arr[i][2],ey-enemies_arr[i][3]) goto ended
end
end
::ended::
enemies_arr[i][6]=enemies_arr[i][6]+1
pewpew.customizable_entity_set_mesh_angle(enemies_arr[i][1],n/45fx,n/360fx,n/260fx,n/170fx)
if enemies_arr[i][7]==0 then
pewpew.create_explosion(ex,ey,0xff000099,5fx,8)
pewpew.entity_destroy(enemies_arr[i][1])
table.remove(enemies_arr,i)
if i~=1 then i=i-1 end
end
end
return enemies_arr
end

function bullet_drone(drone_id,bullets_arr,enemies_arr)
local dx,dy=pewpew.entity_get_position(drone_id)
for i=1,#enemies_arr do
local ex=enemies_arr[i][4]
local ey=enemies_arr[i][5]
local rx1=fmath.abs_fixedpoint(dx-ex)
local ry1=fmath.abs_fixedpoint(dy-ey)
if rx1*rx1+ry1*ry1<1000000fx then
local id1=pewpew.new_customizable_entity(dx,dy)
pewpew.customizable_entity_set_mesh(id1,"/dynamic/drone1.lua",1)
pewpew.customizable_entity_set_mesh_color(id1,0xffff00ff)
pewpew.customizable_entity_set_position_interpolation(id1,true)
table.insert(bullets_arr,{id1,8fx,i,200})
end
end
return bullets_arr
end

function bullet_AI1(bullets_arr,enemies_arr,n)
for i=1,#bullets_arr do
local ex,ey=pewpew.entity_get_position(enemies_arr[bullets_arr[i][3]][1])
local dx,dy=pewpew.entity_get_position(bullets_arr[i][1])
local rx1=fmath.abs_fixedpoint(dx-ex)
local ry1=fmath.abs_fixedpoint(dy-ey)
pewpew.customizable_entity_set_mesh_angle(bullets_arr[i][1],n/35fx,0fx,0fx,n)
bullets_arr[i][4]=bullets_arr[i][4]-1
if rx1>25fx or ry1>25fx then
if ex>dx and ey>dy then pewpew.entity_set_position(bullets_arr[i][1],dx+bullets_arr[i][2],dy+bullets_arr[i][2]) end
if ex>dx and ey<dy then pewpew.entity_set_position(bullets_arr[i][1],dx+bullets_arr[i][2],dy-bullets_arr[i][2]) end
if ex<dx and ey>dy then pewpew.entity_set_position(bullets_arr[i][1],dx-bullets_arr[i][2],dy+bullets_arr[i][2]) end
if ex<dx and ey<dy then pewpew.entity_set_position(bullets_arr[i][1],dx-bullets_arr[i][2],dy-bullets_arr[i][2]) end
if bullets_arr[i][4]<1 then
pewpew.create_explosion(dx,dy,0xffff0066,3fx,4)
pewpew.entity_destroy(bullets_arr[i][1])
table.remove(bullets_arr,i)
if i~=1 then i=i-1 end
end
else
enemies_arr[bullets_arr[i][3]][7]=enemies_arr[bullets_arr[i][3]][7]-1
pewpew.create_explosion(ex,ey,0xff000066,4fx,5)
pewpew.entity_destroy(bullets_arr[i][1])
table.remove(bullets_arr,i)
if i~=1 then i=i-1 end
end
return bullets_arr,enemies_arr
end

end

function bullet_AI2(bullets_arr,enemies_arr,n)
for i=1,#bullets_arr do
local ex,ey=pewpew.entity_get_position(enemies_arr[bullets_arr[i][3]][1])
local dx,dy=pewpew.entity_get_position(bullets_arr[i][1])
local rx1=fmath.abs_fixedpoint(dx-ex)
local ry1=fmath.abs_fixedpoint(dy-ey)
pewpew.customizable_entity_set_mesh_angle(bullets_arr[i][1],n/35fx,0fx,0fx,n)
bullets_arr[i][4]=bullets_arr[i][4]-1
if rx1>25fx or ry1>25fx then
if ex>dx and ey>dy then pewpew.entity_set_position(bullets_arr[i][1],dx+bullets_arr[i][2],dy+bullets_arr[i][2]) end
if ex>dx and ey<dy then pewpew.entity_set_position(bullets_arr[i][1],dx+bullets_arr[i][2],dy-bullets_arr[i][2]) end
if ex<dx and ey>dy then pewpew.entity_set_position(bullets_arr[i][1],dx-bullets_arr[i][2],dy+bullets_arr[i][2]) end
if ex<dx and ey<dy then pewpew.entity_set_position(bullets_arr[i][1],dx-bullets_arr[i][2],dy-bullets_arr[i][2]) end
else
enemies_arr[bullets_arr[i][3]][7]=enemies_arr[bullets_arr[i][3]][7]-1
pewpew.create_explosion(ex,ey,0xff000066,4fx,5)
pewpew.entity_destroy(bullets_arr[i][1])
table.remove(bullets_arr,i)
if i~=1 then i=i-1 end
end
if #bullets_arr~=0 then if bullets_arr[i][4]<1 then
pewpew.create_explosion(dx,dy,0xffff0066,3fx,4)
pewpew.entity_destroy(bullets_arr[i][1])
table.remove(bullets_arr,i)
if i~=1 then i=i-1 end
end end
end
return bullets_arr,enemies_arr
end

function make_color(r, g, b, a)
  local color = r * 256 + g
  color = color * 256 + b
  color = color * 256 + a
  return color
end

function make_color_with_alpha(color, new_alpha)
  local alpha = color % 256
  color = color - alpha + new_alpha
  return color
end

function color_to_string(color)
  local s = string.format("%x", color)
  while string.len(s) < 8 do
    s = "0" .. s
  end
  return "#" .. s
end

function floating_message(x, y, text, scale, color, d_alpha)
  local id = pewpew.new_customizable_entity(x, y)
  local z = 0fx
  local alpha = 255
  pewpew.customizable_entity_set_mesh_scale(id, scale)


  pewpew.entity_set_update_callback(id, function()
    z = z + 20fx
    local color = make_color_with_alpha(color, alpha)
    local color_s = color_to_string(color)
    pewpew.customizable_entity_set_string(id, color_s .. text)
    pewpew.customizable_entity_set_mesh_z(id, z)
    alpha = alpha - d_alpha
    if alpha <= 0 then
      pewpew.entity_destroy(id)
    end
  end)
  return id
end