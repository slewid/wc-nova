extends CharacterBody3D


func _input(event):
	if event is InputEventMouseMotion:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		print(-event.relative.y)
		$Camera3D.rotate_x(-event.relative.y * Globals.mouse_sensitivity)
		rotate_y(-event.relative.x * Globals.mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
		rotation.z =0
		$Camera3D.rotation.z = 0
		
		
func _physics_process(delta):
	velocity.y += -Globals.gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	if Input.is_action_pressed("boost"):
		velocity.x = movement_dir.x * Globals.speed * Globals.sprint_mult
		velocity.z = movement_dir.z * Globals.speed * Globals.sprint_mult
		if Input.is_action_just_pressed("up"):
			velocity.y = Globals.up_speed *Globals.sprint_mult 
		if Input.is_action_just_pressed("down"):
			velocity.y = Globals.down_speed * Globals.sprint_mult 
	else:
		velocity.x = movement_dir.x * Globals.speed
		velocity.z = movement_dir.z * Globals.speed
		if Input.is_action_just_pressed("up"):
			velocity.y = Globals.up_speed  
		if Input.is_action_just_pressed("down"):
			velocity.y = Globals.down_speed  
	
	
	
	
	move_and_slide()
	
