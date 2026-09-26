extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Speed.value = Globals.speed
	$"Mouse sensitivity".value =Globals.mouse_sensitivity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Globals.speed = $Speed.value
	Globals.mouse_sensitivity = $"Mouse sensitivity".value
	if $Quit.button_pressed:
		get_tree().quit()
	if $Main_Menu.button_pressed:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	if $Default.button_pressed:
		Globals.gravity = 3
		Globals.speed = 5
		$Speed.value = Globals.speed
		Globals.sprint_mult = 4
		Globals.up_speed = 5
		Globals.down_speed = -6
		Globals.mouse_sensitivity= 0.005
