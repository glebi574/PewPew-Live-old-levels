c_vertexes={}
c_colors={}
c_segments={}

local d = 15
local d0 = 3
local sc = 1800
local i = 0

for n=1,sc//(d+2*d0) do
	for k=1,sc//(d+2*d0) do
		table.insert(c_vertexes,{n*10fx,k*10fx})
		if n + k ~= 2 then table.insert(c_segments,{i - 1, i}) end
	end
end

meshes = {
  {
    vertexes = c_vertexes,
    segments = c_segments,
    colors = c_colors
  }
}