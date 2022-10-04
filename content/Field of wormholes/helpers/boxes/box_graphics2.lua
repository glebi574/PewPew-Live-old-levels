local helpers = require("/dynamic/helpers/mesh_helpers.lua")

function create_box(color)
  local mesh = helpers.new_mesh()
  helpers.add_vertical_cylinder_to_mesh(mesh, {0,0,0}, 25, 22, 3, color)
  return mesh
end

meshes = {
  create_box(0xff66ffff)
}

