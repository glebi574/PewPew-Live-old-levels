c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local mn2=50
local n1=5
local a=30
local b=30
local index=0
local fk=math.pi*4
local segm1 =fk/mn1
local segm2 =fk/mn2

function xAxis(pivot, Vertices, angle)
    local NewVertices = {}
    for i, v in pairs(Vertices) do
        local pivot = pivot --Vector3.new(pivot[1],pivot[2],pivot[3] or 0)
        local Vector = v --Vector3.new(v[1],v[2],v[3] or 0)
        local PivotVector = {pivot[1] - Vector[1], pivot[2] - Vector[2], pivot[3] - Vector[3]}
        local CurrentAngle = math.atan(PivotVector[3],PivotVector[2])--PivotVector:GetAngle()
        local NewAngle = CurrentAngle + angle
        local sin= math.sin(NewAngle)
        local cos = math.cos(NewAngle)
        local radius = math.sqrt(PivotVector[2] * PivotVector[2] + PivotVector[3] * PivotVector[3])
        table.insert(NewVertices, {v[1], pivot[2] + cos * radius,pivot[3] + sin * radius})
    end
    return NewVertices
end

function yAxis(pivot, Vertices, angle)
    local NewVertices = {}
    for i, v in pairs(Vertices) do
        local pivot = pivot --Vector3.new(pivot[1],pivot[2],pivot[3] or 0)
        local Vector = v --Vector3.new(v[1],v[2],v[3] or 0)
        local PivotVector = {pivot[1] - Vector[1], pivot[2] - Vector[2], pivot[3] - Vector[3]}
        local CurrentAngle = math.atan(PivotVector[3],PivotVector[1])--PivotVector:GetAngle()
        local NewAngle = CurrentAngle + angle
        local sin= math.sin(NewAngle)
        local cos = math.cos(NewAngle)
        local radius = math.sqrt(PivotVector[1] * PivotVector[1] + PivotVector[3] * PivotVector[3])
        table.insert(NewVertices, {pivot[1] + cos * radius,v[2],pivot[3] + sin * radius})
    end
    return NewVertices
end

function zAxis(pivot, Vertices, angle)
    local NewVertices = {}
    for i, v in pairs(Vertices) do
        local pivot = pivot --Vector3.new(pivot[1],pivot[2],pivot[3] or 0)
        local Vector = v --Vector3.new(v[1],v[2],v[3] or 0)
        local PivotVector = {pivot[1] - Vector[1], pivot[2] - Vector[2], pivot[3] - Vector[3]}
        local CurrentAngle = math.atan(PivotVector[2],PivotVector[1])--PivotVector:GetAngle()
        local NewAngle = CurrentAngle + angle
        local sin= math.sin(NewAngle)
        local cos = math.cos(NewAngle)
        local radius = math.sqrt(PivotVector[1] * PivotVector[1] + PivotVector[2] * PivotVector[2])
        table.insert(NewVertices, {pivot[1] + cos * radius,pivot[2] + sin * radius,v[3]})
    end
    return NewVertices
end

function a_color(re, gr, bl, al)
  local color = re * 256 + gr
  color = color * 256 + bl
  color = color * 256 + al
  return color
end

for k=1,mn1 do
local x0=-mn2*a/2+(k-1)*a
for i=1,mn2 do
local y0=-mn1*b/2+(i-1)*b
local x=x0+a/2
local y=y0+b/2
local z=math.sin(segm1*k)*math.sin(segm2*i)*200
local c1=a_color(99,i*n1,k*n1,199)

local u_vertexes={{x-10,y,z},{x+10,y,z},{x,y-10,z},{x,y+10,z},{x,y,z-10},{x,y,z+10}}
local ang1=math.random(0,math.floor(math.pi*2*9900))/10000
local ang2=math.random(0,math.floor(math.pi*2*9900))/10000
local ang3=math.random(0,math.floor(math.pi*2*9900))/10000
u_vertexes=xAxis({x,y,z},u_vertexes,ang1)
u_vertexes=yAxis({x,y,z},u_vertexes,ang2)
u_vertexes=zAxis({x,y,z},u_vertexes,ang3)
table.insert(c_vertexes,u_vertexes[1])
table.insert(c_vertexes,u_vertexes[2])
table.insert(c_vertexes,u_vertexes[3])
table.insert(c_vertexes,u_vertexes[4])
table.insert(c_vertexes,u_vertexes[5])
table.insert(c_vertexes,u_vertexes[6])
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)
table.insert(c_colors,c1)

table.insert(c_segments,{index,index+1})
table.insert(c_segments,{index+2,index+3})
table.insert(c_segments,{index+4,index+5})
index=index+6
end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}