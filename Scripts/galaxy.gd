extends Node3D
class_name Galaxy

@export var particle_scene: PackedScene

var amount_range: Array[int] = [50, 150]
var distance_range: int = 4000

var my_stars = []
var player: Player

func _ready():
	randomize()

	for x in range(randi_range(amount_range[0], amount_range[1])):
		var instantiated = particle_scene.instantiate()

		instantiated.position.x = randi_range(-distance_range, distance_range)
		instantiated.position.y = randi_range(-distance_range, distance_range)
		instantiated.position.z = randi_range(-distance_range, distance_range)

		add_child(instantiated)
		my_stars.append(instantiated)

func _process(delta) -> void:
	pass
