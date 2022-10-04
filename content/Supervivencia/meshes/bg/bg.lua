local c_vertexes = {}
local c_segments = {}
local c_colors = {}

local a = 48
local k = 72
local b = 20
local z = -1000
local zr = 100

local n1 = 42
local j1 = 28
local n2 = n1 - 1
local j2 = j1 - 1
local i = 0

local t1 = (n1 * (2 * a + k) + (n1 - 1) * b) / 2
local t2 = (2 * j1 * a + (j1 - 1) * b) / 2

function r_color(r, g, b, a)
	local color = r * 256 + g
	color = color * 256 + b
	color = color * 256 + a
	return color
end

local cvh = {
	{0, a},
	{a, 0},
	{k + a, 0},
	{k + 2 * a, a},
	{k + a, 2 * a},
	{a, 2 * a}
}

for n = 1, n1 do
	for j = 1, j1 do
		local z_ = z + math.random(-zr, zr)
		local color
		if math.random(0,1)==1 then color = r_color(math.random(110,199), math.random(0,49), 11, math.random(79,129))
		else color = r_color(math.random(0,49), math.random(110,199), 11, math.random(79,129)) end
		for m = 1, 6 do
			table.insert(c_vertexes, {cvh[m][1] - t1 + (2 * a + k + b) * (n - 1), cvh[m][2] - t2 + (2 * a + b) * (j - 1), z_})
			table.insert(c_colors, color)
		end
		table.insert(c_segments, {i, i+1, i+2, i+3, i+4, i+5, i})
		i = i + 6
	end
end

local cvs = {
	{k + a + b / 2, 2 * a + b / 2},
	{k + 2 * a + b / 2, a + b / 2},
	{k + 3 * a + b / 2, 2 * a + b / 2},
	{k + 2 * a + b / 2, 3 * a + b / 2}
}

for n = 1, n2 do
	for j = 1, j2 do
		local z_ = z + math.random(-zr, zr)
		local color
		if math.random(0,1)==1 then color = r_color(math.random(110,199), math.random(0,49), 11, math.random(79,129))
		else color = r_color(math.random(0,49), math.random(110,199), 11, math.random(79,129)) end
		for m = 1, 4 do
			table.insert(c_vertexes, {cvs[m][1] - t1 + (2 * a + k + b) * (n - 1), cvs[m][2] - t2 + (2 * a + b) * (j - 1), z_})
			table.insert(c_colors, color)
		end
		table.insert(c_segments, {i, i+1, i+2, i+3, i})
		i = i + 4
	end
end

meshes = {
	{
		vertexes = c_vertexes,
		segments = c_segments,
		colors = c_colors
	}
}