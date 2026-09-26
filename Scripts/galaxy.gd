extends Node3D
class_name Galaxy

@export var particle_scene: PackedScene

var amount_range: Array[int] = [50, 200]
var initial_distance: int = 100

func _ready():
	randomize()

	for x in range(randi_range(amount_range[0], amount_range[1])):
		var instantiated = particle_scene.instantiate()

		instantiated.position.x = randi_range(-initial_distance, initial_distance)
		instantiated.position.y = randi_range(-initial_distance, initial_distance)
		instantiated.position.z = randi_range(-initial_distance, initial_distance)

		add_child(instantiated)
