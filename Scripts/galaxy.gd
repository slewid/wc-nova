extends Node3D
class_name Galaxy

@export var particle_scene: PackedScene

var amount_range: Array[int] = [300,500]
var distance_range: int = 15000

var my_stars = []
var player: Player

var particle_elements: Dictionary[Globals.GameElements, Globals.ParticleElement]

func _ready():
	randomize()

	particle_elements = Globals.gen_elements()

	for x in range(randi_range(amount_range[0], amount_range[1])):
		var instantiated = particle_scene.instantiate()

		instantiated.position.x = randi_range(-distance_range, distance_range)
		instantiated.position.y = randi_range(-distance_range, distance_range)
		instantiated.position.z = randi_range(-distance_range, distance_range)

		instantiated.galaxy = self

		add_child(instantiated)
		my_stars.append(instantiated)
