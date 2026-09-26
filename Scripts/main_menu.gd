extends Control

func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Quit.button_pressed:
		get_tree().quit()
	if $Settings.button_pressed:
		get_tree().change_scene_to_file("res://Scenes/settings.tscn")
	if $Start.button_pressed:
		get_tree().change_scene_to_file("res://Scenes/test.tscn")
