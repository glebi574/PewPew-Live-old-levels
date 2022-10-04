
local mesh_q = {
  vertexes = {{11,-6},{11,15},{11,5},{8,2},{3,2},{0,5},{0,11},{3,14},{8,14},{11,11}},
  segments = {{0,1},{2,3,4,5,6,7,8,9}},
  size=11 --width
}


local mesh_w = {
  vertexes = {{0,15},{3.9,0},{4.1,0},{7.9,14},{8.1,14},{11.9,0},{12.1,0},{16,15}},
  segments = {{0,1,2,3,4,5,6,7}},
  size=16
}

local mesh_e = {
  vertexes = {{11,3},{8,0},{3,0},{0,3},{0,12},{3,14},{8,14},{11,12},{11,8},{0,8}},
  segments = {{0,1,2,3,4,5,6,7,8,9}},
  size=11
}

local mesh_r = {
  vertexes = {{0,0},{0,15},{0,11},{3,14},{7,14},{10,11}},
  segments = {{0,2},{1,2,3,4,5}},
  size=10
}

local mesh_t = {
  vertexes = {{3,22},{3,0},{7,0},{0,11},{6,11}},
  segments = {{0,1,2},{3,4}},
  size=7
}

local mesh_y = {
  vertexes = {{0,15},{5.5,3},{10,15},{3,-2},{1,-3}},
  segments = {{0,1},{2,3,4}},
  size=10
}

local mesh_u = {
  vertexes = {{0,15},{0,3},{3,0},{7,0},{10,3},{10,15}},
  segments = {{0,1,2,3,4,5}},
  size=10
}

local mesh_i = {
  vertexes = {{0,0},{0,11},{0,13},{0,15}},
  segments = {{0,1},{2,3}},
  size=1
}

local mesh_o = {
  vertexes = {{0,3},{3,0},{7,0},{10,3},{10,11},{7,14},{3,14},{0,11}},
  segments = {{0,1,2,3,4,5,6,7,0}},
  size=10
}

local mesh_p = {
  vertexes = {{0,-6},{0,15},{0,5},{3,2},{8,2},{11,5},{11,11},{8,14},{3,14},{0,11}},
  segments = {{0,1},{2,3,4,5,6,7,8,9}},
  size=11
}

local mesh_a = {
  vertexes = {{0,12},{3,14},{8,14},{11,12},{11,-1},{11,3},{8,0},{3,0},{0,3},{0,6},{3,9},{8,9},{11,6}},
  segments = {{0,1,2,3,4},{5,6,7,8,9,10,11,12}},
  size=11
}

local mesh_s = {
  vertexes = {{10,14},{3,14},{0,12},{0,10},{3,8},{7,8},{10,6},{10,3},{7,0},{0,0}},
  segments = {{0,1,2,3,4,5,6,7,8,9}},
  size=10
}

local mesh_d = {
  vertexes = {{11,22},{11,-1},{11,3},{8,0},{3,0},{0,3},{0,10},{3,13},{8,13},{11,10}},
  segments = {{0,1},{2,3,4,5,6,7,8,9}},
  size=11
}

local mesh_f = {
  vertexes = {{3,0},{3,22},{8,22},{0,11},{6,11}},
  segments = {{0,1,2},{3,4}},
  size=8
}

local mesh_g = {
  vertexes = {{11,14},{11,-1},{8,-4},{3,-4},{0,-1},{11,11},{8,14},{3,14},{0,11},{0,5},{3,2},{8,2},{11,5}},
  segments = {{0,1,2,3,4},{5,6,7,8,9,10,11,12}},
  size=11
}

local mesh_h = {
  vertexes = {{0,0},{0,22},{0,12},{3,15},{6,15},{9,12},{9,0}},
  segments = {{0,1},{2,3,4,5,6}},
  size=9
}

local mesh_j = {
  vertexes = {{0,-3},{5,-3},{5,11},{5,13},{5,15}},
  segments = {{0,1,2},{3,4}},
  size=5
}

local mesh_k = {
  vertexes = {{0,0},{0,22},{9,0},{1,8},{9,13}},
  segments = {{0,1},{2,3,4}},
  size=9
}

local mesh_l = {
  vertexes = {{0,22},{0,0},{4,0}},
  segments = {{0,1,2}},
  size=4
}

local mesh_z = {
  vertexes = {{0,14},{10,14},{1,0},{10,0}},
  segments = {{0,1,2,3}},
  size=10
}

local mesh_x = {
  vertexes = {{0,15},{10,0},{0,0},{10,15}},
  segments = {{0,1},{2,3}},
  size=10
}

local mesh_c = {
  vertexes = {{10,11},{7,14},{3,14},{0,11},{0,3},{3,0},{7,0},{10,3}},
  segments = {{0,1,2,3,4,5,6,7}},
  size=10
}

local mesh_v = {
  vertexes = {{0,15},{5.8,0},{6.2,0},{12,15}},
  segments = {{0,1,2,3}},
  size=12
}

local mesh_b = {
  vertexes = {{0,22},{0,-1},{0,3},{3,0},{8,0},{11,3},{11,11},{8,14},{3,14},{0,11}},
  segments = {{0,1},{2,3,4,5,6,7,8,9}},
  size=11
}

local mesh_n = {
  vertexes = {{0,0},{0,15},{0,11},{3,14},{7,14},{10,11},{10,0}},
  segments = {{0,1},{2,3,4,5,6}},
  size=10
}

local mesh_m = {
  vertexes = {{0,0},{0,14},{0,12},{6,14},{6,0},{6,12},{12,14},{12,0}},
  segments = {{0,1},{2,3,4},{5,6,7}},
  size=12
}

--symbols

local mesh_dot = {
  vertexes = {{0,0},{2,0}},
  segments = {{0,1}},
  size=2
}

local mesh_comma = {
  vertexes = {{2,2},{-1,-4}},
  segments = {{0,1}},
  size=2
}

local mesh_apostrophe = { --` to create
  vertexes = {{2,16},{-1,10}},
  segments = {{0,1}},
  size=2
}

local mesh_colons = {
  vertexes = {{0,2},{0,4},{0,14},{0,16}},
  segments = {{0,1},{2,3}},
  size=2
}

local mesh_semicolons = {
  vertexes = {{0,14},{0,16},{2,1},{-1,-4}},
  segments = {{0,1},{2,3}},
  size=2
}

local mesh_1 = {
  vertexes = {{0,14},{5,18},{5,0}},
  segments = {{0,1,2}},
  size=5
}

local mesh_2 = {
  vertexes = {{0,14},{4,18},{9,18},{13,14},{13,10},{2,0},{13,0}},
  segments = {{0,1,2,3,4,5,6}},
  size=13
}

local mesh_3 = {
  vertexes = {{0,18},{10,18},{13,15},{13,12},{9,9},{13,6},{13,3},{10,0},{0,0},{0,9}},
  segments = {{0,1,2,3,4,5,6,7,8},{4,9}},
  size=13
}

local mesh_4 = {
  vertexes = {{0,18},{0,9},{13,9},{13,18},{13,0}},
  segments = {{0,1,2},{3,4}},
  size=13
}

local mesh_5 = {
  vertexes = {{13,18},{0,18},{0,12},{8,12},{12,8},{12,4},{8,0},{-1,0}},
  segments = {{0,1,2,3,4,5,6,7}},
  size=13
}

local mesh_6 = {
  vertexes = {{13,15},{10,18},{3,18},{0,15},{0,3},{3,0},{10,0},{13,3},{13,7},{10,10},{0,10}},
  segments = {{0,1,2,3,4,5,6,7,8,9,10}},
  size=13
}

local mesh_7 = {
  vertexes = {{0,18},{11,18},{3,0}},
  segments = {{0,1,2}},
  size=11
}

local mesh_8 = {
  vertexes = {{7,18},{3,18},{0,15},{0,12},{10,6},{10,3},{7,0},{3,0},{0,3},{0,6},{10,12},{10,15}},
  segments = {{0,1,2,3,4,5,6,7,8,9,10,11,0}},
  size=10
}

local mesh_9 = {
  vertexes = {{0,3},{3,0},{10,0},{13,3},{13,15},{10,18},{3,18},{0,15},{0,11},{3,8},{13,8}},
  segments = {{0,1,2,3,4,5,6,7,8,9,10}},
  size=13
}

local mesh_0 = {
  vertexes = {{0,4},{4,0},{9,0},{13,4},{13,14},{9,18},{4,18},{0,14}},
  segments = {{0,1,2,3,4,5,6,7,0}},
  size=13
}

local mesh_nolla = { --@ to create it
  vertexes = {{0,0},{18,18},{2,2},{16,2},{16,16},{2,16}},
  segments = {{0,1},{2,3,4,5,2}},
  size=18
}

local mesh_bracket1 = {
  vertexes = {{4,18},{0,14},{0,4},{4,0}},
  segments = {{0,1,2,3}},
  size=4
}

local mesh_bracket2 = {
  vertexes = {{0,18},{4,14},{4,4},{0,0}},
  segments = {{0,1,2,3}},
  size=4
}

local mesh_slash = {
  vertexes = {{0,0},{9,18}},
  segments = {{0,1}},
  size=9
}

local mesh_question = {
  vertexes = {{0,12},{0,15},{3,18},{8,18},{11,15},{11,12},{6,7},{6,4},{6,3},{6,0}},
  segments = {{0,1,2,3,4,5,6,7},{8,9}},
  size=11
}

local mesh_exclamation = {
  vertexes = {{0,0},{0,3},{0,4},{0,17}},
  segments = {{0,1},{2,3}},
  size=1
}

--mesh

local c_vertexes={}
local c_segments={}
local c_colors={}

local if_colors=false
local default_color=0x33ff33ff
local colors_arr={

}

local letter_distance=4
local word_distance=20
local string_distance=30

local index=0
local dx=0
local dy=0

local text='welcome!|if you are playing first time,|you can take training|(there is only training now)'

local text_len=string.len(text)
local text_arr={}

for i=1,text_len do
table.insert(text_arr,string.sub(text,i,i))
end

for i=1, #text_arr do
local mesh={}
local if_matter=true
local if_default_color=true
local current_color
if text_arr[i]=='q' then
mesh=mesh_q
else
if text_arr[i]=='w' then
mesh=mesh_w
else
if text_arr[i]=='e' then
mesh=mesh_e
else
if text_arr[i]=='r' then
mesh=mesh_r
else
if text_arr[i]=='t' then
mesh=mesh_t
else
if text_arr[i]=='y' then
mesh=mesh_y
else
if text_arr[i]=='u' then
mesh=mesh_u
else
if text_arr[i]=='i' then
mesh=mesh_i
else
if text_arr[i]=='o' then
mesh=mesh_o
else
if text_arr[i]=='p' then
mesh=mesh_p
else
if text_arr[i]=='a' then
mesh=mesh_a
else
if text_arr[i]=='s' then
mesh=mesh_s
else
if text_arr[i]=='d' then
mesh=mesh_d
else
if text_arr[i]=='f' then
mesh=mesh_f
else
if text_arr[i]=='g' then
mesh=mesh_g
else
if text_arr[i]=='h' then
mesh=mesh_h
else
if text_arr[i]=='j' then
mesh=mesh_j
else
if text_arr[i]=='k' then
mesh=mesh_k
else
if text_arr[i]=='l' then
mesh=mesh_l
else
if text_arr[i]=='z' then
mesh=mesh_z
else
if text_arr[i]=='x' then
mesh=mesh_x
else
if text_arr[i]=='c' then
mesh=mesh_c
else
if text_arr[i]=='v' then
mesh=mesh_v
else
if text_arr[i]=='b' then
mesh=mesh_b
else
if text_arr[i]=='n' then
mesh=mesh_n
else
if text_arr[i]=='m' then
mesh=mesh_m
else
if text_arr[i]=='.' then
mesh=mesh_dot
else
if text_arr[i]==',' then
mesh=mesh_comma
else
if text_arr[i]=='`' then
mesh=mesh_apostrophe
else
if text_arr[i]==':' then
mesh=mesh_colons
else
if text_arr[i]==';' then
mesh=mesh_semicolons
else
if text_arr[i]=='/' then
mesh=mesh_slash
else
if text_arr[i]=='@' then
mesh=mesh_nolla
else
if text_arr[i]=='0' then
mesh=mesh_0
else
if text_arr[i]=='1' then
mesh=mesh_1
else
if text_arr[i]=='2' then
mesh=mesh_2
else
if text_arr[i]=='3' then
mesh=mesh_3
else
if text_arr[i]=='4' then
mesh=mesh_4
else
if text_arr[i]=='5' then
mesh=mesh_5
else
if text_arr[i]=='6' then
mesh=mesh_6
else
if text_arr[i]=='7' then
mesh=mesh_7
else
if text_arr[i]=='8' then
mesh=mesh_8
else
if text_arr[i]=='9' then
mesh=mesh_9
else
if text_arr[i]=='(' then
mesh=mesh_bracket1
else
if text_arr[i]==')' then
mesh=mesh_bracket2
else
if text_arr[i]=='!' then
mesh=mesh_exclamation
else
if text_arr[i]=='?' then
mesh=mesh_question
else
if text_arr[i]=='|' then
dx=0
dy=dy-string_distance-18
if_matter=false
else
if text_arr[i]==' ' then
dx=dx+word_distance
if_matter=false
end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end
if if_matter then
for n=1,#mesh.vertexes do
local nx=mesh.vertexes[n][1]+dx
local ny=mesh.vertexes[n][2]+dy
table.insert(c_vertexes,{nx,ny})
if if_colors then
for m=1,#colors_arr do
for k=1,#colors_arr[m][1] do
if i==colors_arr[m][1][k] then
if_default_color=false
current_color=colors_arr[m][2]
break
end
end
end
if if_default_color then
table.insert(c_colors,default_color)
else
table.insert(c_colors,current_color)
end
end
end
for n=1,#mesh.segments do
local arr={}
for m=1,#mesh.segments[n] do
table.insert(arr,mesh.segments[n][m]+index)
end
table.insert(c_segments,arr)
end
index=index+#mesh.vertexes
dx=dx+letter_distance+mesh.size
end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}