extends CharacterBody3D


func _input(event):
	if event is InputEventMouseMotion:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
		$Camera3D.rotate_x(-event.relative.y * Globals.mouse_sensitivity)
		rotate_y(-event.relative.x * Globals.mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))


func _physics_process(delta):
	var horizontal_input : Vector2 = Input.get_vector("left","right","forward","back")
	var vertical_input : float = Input.get_axis("down","up")
	var movement_dir = transform.basis * Vector3(horizontal_input.x, vertical_input, horizontal_input.y)
	
	var speed = Globals.speed * (Globals.sprint_mult if Input.is_action_pressed("boost") else 1)
	velocity.x = movement_dir.x * speed
	velocity.y = movement_dir.y * speed
	velocity.z = movement_dir.z * speed
	
	move_and_slide()
