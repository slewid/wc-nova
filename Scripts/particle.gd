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

func _ready() -> void:
	size = randf_range(0, 1)
	density = randf_range(0, 1)
	omni_range = randf_range(1, 4096)

	gen_elements()
	gen_colour()

func gen_colour():
	for element in particle_elements.values():
		if element.element.colour == Colours.R:
			light_color.r = element.concentration * 255

			continue

		if element.element.colour == Colours.G:

			light_color.g = element.concentration * 255
			continue

		if element.element.colour == Colours.B:
			light_color.b = element.concentration * 255

			continue

	print(light_color)

func gen_elements():
	for element in range(GameElements.size()):
		particle_elements[element] = ParticleElement.new(randf_range(0, 1), elements[element])
