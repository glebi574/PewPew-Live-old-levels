c_vertexes={}
c_colors={}
c_segments={}

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

local mn1=6
local mn2=30
local fk=2*math.pi
local r1=50
local r2=50
local r3_1=300
local r3_2=450
local index1 = 0
local c1=0xffffffff
local segm1 =fk/mn1

for i=1,mn2 do
local ang1=math.random(0,math.floor(math.pi*2*9900))/10000
local ang2=math.random(0,math.floor(math.pi*2*9900))/10000
local ang3=math.random(0,math.floor(math.pi*2*9900))/10000
local z1=math.random(r3_1,r3_2)
local c_vertexes_l={}
for k=1,mn1 do
local x1=math.sin(k*segm1)*r1
local y1=math.cos(k*segm1)*r2

table.insert(c_vertexes_l,{x1,y1,z1})
table.insert(c_colors,c1)
if k~=mn1 then table.insert(c_segments,{index1,index1+1}) else table.insert(c_segments,{index1,index1+1-mn1}) end
index1=index1+1

end
c_vertexes_l=xAxis({0,0,0},c_vertexes_l,ang1)
c_vertexes_l=yAxis({0,0,0},c_vertexes_l,ang2)
c_vertexes_l=zAxis({0,0,0},c_vertexes_l,ang3)
for i=1,#c_vertexes_l do
table.insert(c_vertexes,c_vertexes_l[i])
end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}