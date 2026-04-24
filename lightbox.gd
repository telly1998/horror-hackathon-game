extends Area2D

func _ready():
	# Make sure these lines are NOT commented out (no # in front)
	input_event.connect(_on_my_input_event) 
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_my_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Click detected! Swapping scene...")
		get_tree().change_scene_to_file("res://bulbminigame.tscn")

func _on_mouse_entered():
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
