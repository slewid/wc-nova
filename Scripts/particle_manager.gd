extends Node3D
class_name ParticleManager

@export var particle_scene: PackedScene
@export var initial_range: int = 4000
@export var initial_distance: int = 2000

func _ready():
	randomize()

func generate():
	for x in range(initial_range):
		var instantiated = particle_scene.instantiate()

		instantiated.position.x = randi_range(-initial_distance, initial_distance)
		instantiated.position.y = randi_range(-initial_distance, initial_distance)
		instantiated.position.z = randi_range(-initial_distance, initial_distance)

		add_child(instantiated)
