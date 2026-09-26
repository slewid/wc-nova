extends CharacterBody3D
class_name Player

@export var camera: Camera3D

func _input(event):
	if event is InputEventMouseMotion:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
		camera.rotate_x(-event.relative.y * Globals.mouse_sensitivity)
		rotate_y(-event.relative.x * Globals.mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			camera.global_position += -camera.global_transform.basis.z * Globals.zoom_constant
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			camera.global_position += camera.global_transform.basis.z * Globals.zoom_constant

func _physics_process(delta):
	var horizontal_input : Vector2 = Input.get_vector("left","right","forward","back")
	var vertical_input : float = Input.get_axis("down","up")
	var movement_dir = (transform.basis * camera.transform.basis) * Vector3(horizontal_input.x, vertical_input, horizontal_input.y)
	
	var speed = Globals.speed * (Globals.sprint_mult if Input.is_action_pressed("boost") else 1)
	velocity.x = movement_dir.x * speed * delta
	velocity.y = movement_dir.y * speed * delta
	velocity.z = movement_dir.z * speed * delta
	
	move_and_slide()
