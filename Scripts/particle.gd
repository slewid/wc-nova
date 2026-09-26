extends Elements
class_name Particle

class ParticleElement:
	var concentration: float
	var element: Element

	func _init(_concentration, _element):
		concentration = _concentration
		element = _element

var size: float
var density: float
var luminosity: float
var particle_elements: Dictionary[GameElements, ParticleElement]
var surface_material = null

var density_range = [0.0, 1]
var size_range = [8, 24]

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

	gen_elements()
	gen_colour()

func gen_colour():
	surface_material.emission = Color(0, 0, 0)

	for element in particle_elements.values():
		if element.element.colour == Colours.R:
			surface_material.emission.r += element.concentration * 255

			continue

		if element.element.colour == Colours.G:
			surface_material.emission.g += element.concentration * 255

			continue

		if element.element.colour == Colours.B:
			surface_material.emission.b += element.concentration * 255

			continue

	print(surface_material.emission)

func gen_elements():
	var rand_vals = []
	var s = 0

	for element in range(GameElements.size()):
		var val = randf_range(0, 1)
		rand_vals.append([element, val])
		s += val

	for val in rand_vals:
		var balenced = val[1]/s

		particle_elements[val[0]] = ParticleElement.new(balenced, elements[val[0]])
