extends Node3D

@export var environment: WorldEnvironment
@export var particle_manager: ParticleManager

func _ready() -> void:
	particle_manager.generate()
