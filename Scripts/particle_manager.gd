extends Node3D
class_name ParticleManager

@export var galaxy_scene: PackedScene

var amount_range: Array[int] = [200, 300]
var start_range: int = 300000
var start_distance: int = 20000

func generate(player):
	randomize()

	var funky_range = range(start_range)
	var funky_range2 = range(0, -start_range, -1)

	for val in funky_range2:
		funky_range.append(val)

	funky_range = funky_range.filter(func(x): return x > start_distance or x < -start_distance)

	for x in range(randi_range(amount_range[0], amount_range[1])):
		var instantiated = galaxy_scene.instantiate()

		instantiated.position.x = funky_range.pick_random()
		instantiated.position.y = funky_range.pick_random()
		instantiated.position.z = funky_range.pick_random()
		instantiated.player = player

		add_child(instantiated)
