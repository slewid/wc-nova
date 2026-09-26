extends Node3D

@export var environment: WorldEnvironment
@export var particle_manager: ParticleManager
@export var player: Player

func _ready():
	particle_manager.generate(player)
