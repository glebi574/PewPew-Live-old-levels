local helpers = require("/dynamic/helpers/mesh_helpers.lua")

function create_ultra_inner_mesh()
  local mesh = {}
  local c = 0x9900ccff
  mesh.vertexes = {{-3, 9}, {-3, -9}, {3, -9}, {3 ,9}}
  mesh.segments = {{0,1,2,3}}
  mesh.colors = c
  return mesh
end

meshes = {
  create_ultra_inner_mesh(),
  {
    vertexes = {{-3, -9}, {-3, 9}, {3, -9}, {3 ,9}, {-3,0}, {3,0}},
    segments = {{0,1},{2,3},{4,5}},
    colors = 0xffff00ff
  },
}

