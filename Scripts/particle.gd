extends MeshInstance3D
class_name Particle

var size: float
var density: float
var luminosity: float
var particle_elements: Dictionary[Globals.GameElements, Globals.ParticleElement]
var surface_material = null
var galaxy: Galaxy

var density_range = [0, 1]
var size_range = [50, 400]

func _ready() -> void:
	randomize()

	var active_mat = get_active_material(0)
	
	if active_mat:
		var unique_mat = active_mat.duplicate()

		set_surface_override_material(0, unique_mat)

	size = randf_range(size_range[0], size_range[1])
	density = randf_range(density_range[0], density_range[1])
	scale.x = size
	scale.y = size
	scale.z = size

	surface_material = mesh.surface_get_material(0)
	surface_material.emission_energy_multiplier = density

	particle_elements = Globals.gen_elements()
	gen_colour()

func gen_colour():
	surface_material.emission = Color(0, 0, 0)

	for element in particle_elements.values():
		if element.element.colour == Globals.Colours.R:
			surface_material.emission.r += element.concentration * 255

			continue

		if element.element.colour == Globals.Colours.G:
			surface_material.emission.g += element.concentration * 255

			continue

		if element.element.colour == Globals.Colours.B:
			surface_material.emission.b += element.concentration * 255

			continue
