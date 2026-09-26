extends Node

@export var zoom_constant: int = 30
@export var gravity = 0
@export var speed = 7000
@export var sprint_mult = 4
@export var up_speed = 5
@export var down_speed = -6
@export var mouse_sensitivity= 0.005

@export var rand_galaxy_range:float = 0.6

enum Colours {
	R,
	G,
	B
}

enum GameElements {
	SULFUR, # R
	HYDROGEN, # G
	OXYGEN # B
}

class ParticleElement:
	var concentration: float
	var element: Globals.Element

	func _init(_concentration, _element):
		concentration = _concentration
		element = _element

class Element:
	var element: GameElements
	var colour: Colours

	func _init(_element, _colour):
		element = _element
		colour = _colour

var elements: Array[Element] = [
	Element.new(GameElements.SULFUR, Colours.R),
	Element.new(GameElements.HYDROGEN, Colours.G),
	Element.new(GameElements.OXYGEN, Colours.B)
]

func gen_elements():
	var particle_elements: Dictionary[GameElements, ParticleElement] = {}
	var rand_vals = []
	var s = 0

	for element in range(GameElements.size()):
		var val = randf_range(0, 1)
		rand_vals.append([element, val])
		s += val

	for val in rand_vals:
		var balenced = val[1]/s

		particle_elements[val[0]] = ParticleElement.new(balenced, elements[val[0]])

	return particle_elements

func gen_elements_based(base):
	var new_elements: Dictionary[GameElements, ParticleElement] = {}
	
	for element in base:
		new_elements[element] = base[element]
		new_elements[element].concentration = new_elements[element].concentration + randf_range(-rand_galaxy_range, rand_galaxy_range)

		new_elements[element].concentration = abs(new_elements[element].concentration) if abs(new_elements[element].concentration) > 1 else abs(new_elements[element].concentration) - (abs(new_elements[element].concentration) - 1)

	return new_elements
