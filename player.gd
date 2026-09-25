extends CharacterBody3D

@export var gravity = 3
@export var speed = 5
@export var sprint_mult = 4
@export var up_speed = 5
@export var down_speed = -6
@export var mouse_sensitivity= 0.005
func _input(event):
	if event is InputEventMouseMotion:
		print(-event.relative.y)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
		rotation.z =0
		$Camera3D.rotation.z = 0
		
		
func _physics_process(delta):
	velocity.y += -gravity * delta
	var input = Input.get_vector("left", "right", "forward", "back")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	if Input.is_action_pressed("boost"):
		velocity.x = movement_dir.x * speed * sprint_mult
		velocity.z = movement_dir.z * speed * sprint_mult
		if Input.is_action_just_pressed("up"):
			velocity.y = up_speed *sprint_mult 
		if Input.is_action_just_pressed("down"):
			velocity.y = down_speed * sprint_mult 
	else:
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed
		if Input.is_action_just_pressed("up"):
			velocity.y = up_speed  
		if Input.is_action_just_pressed("down"):
			velocity.y = down_speed  
	
	
	
	
	move_and_slide()
	
