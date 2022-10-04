local helpers = require("/dynamic/helpers/mesh_helpers.lua")

function create_low_inner_mesh()
  local mesh = {}
  local c = 0xffffffff
  mesh.vertexes = {{-3,9},{-3,-9},{6,-9}}
  mesh.segments = {{0,1,2}}
  mesh.colors = c
  return mesh
end

function create_high_inner_mesh()
  local mesh = {}
  local c = 0xffffffff
  mesh.vertexes = {{-1, -3}, {-1, 3}, {1, -3}, {1 ,3}, {-1,0}, {1,0}}
  mesh.segments = {{0,1},{2,3},{4,5}}
  mesh.colors = c
  return mesh
end

meshes = {
  create_low_inner_mesh(),
  {
    vertexes = {{-4,12},{-4,-12},{8,-12}},
    segments = {{0,1,2}},
    colors = 0xffffffff
  },
  create_high_inner_mesh(),
  {
    vertexes = {{-1, -3}, {-1, 3}, {1, -3}, {1 ,3}, {-1,0}, {1,0}},
    segments = {{0,1},{2,3},{4,5}},
    colors = 0xffffffff
  },
}

