c_vertexes={}
c_colors={}
c_segments={}

local mn1=50
local mn2=50
local fk=2*math.pi
local r1=300
local r2=300
local r3=300
local index1 = 0
local segm1 =fk/mn1
local segm2 =fk/mn2/2

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

for k=0,mn2 do
local z=r3*math.cos(k*segm2)
for i=1,mn1 do
local x=math.cos(i*segm1)*r1*math.sin(k*segm2)
local y=math.sin(i*segm1)*r2*math.sin(k*segm2)

local c1=a_color(math.floor(math.abs(x)/2),math.floor(math.abs(y)/2),math.floor(math.abs(z)/2),199)

local u_vertexes={{x-10,y,z},{x+10,y,z},{x,y-10,z},{x,y+10,z},{x,y,z-10},{x,y,z+10}}
local ang1=math.random(0,math.floor(math.pi*2*9900))/10000
local ang2=math.random(0,math.floor(math.pi*2*9900))/10000
local ang3=math.random(0,math.floor(math.pi*2*9900))/10000
u_vertexes=xAxis({0,0,0},u_vertexes,ang1)
u_vertexes=yAxis({0,0,0},u_vertexes,ang2)
u_vertexes=zAxis({0,0,0},u_vertexes,ang3)
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

table.insert(c_segments,{index1,index1+1})
table.insert(c_segments,{index1+2,index1+3})
table.insert(c_segments,{index1+4,index1+5})
index1=index1+6
end

end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}