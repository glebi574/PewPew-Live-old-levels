local helpers = require("/dynamic/helpers/mesh_helpers.lua")

function create_high_inner_mesh()
  local mesh = {}
  local c = 0xffff00ff
  mesh.vertexes = {{-3, -9}, {-3, 9}, {3, -9}, {3 ,9}, {-3,0}, {3,0}}
  mesh.segments = {{0,1},{2,3},{4,5}}
  mesh.colors = c
  return mesh
end

meshes = {
  create_high_inner_mesh(),
  {
    vertexes = {{-3, -9}, {-3, 9}, {3, -9}, {3 ,9}, {-3,0}, {3,0}},
    segments = {{0,1},{2,3},{4,5}},
    colors = 0xffff00ff
  },
}

