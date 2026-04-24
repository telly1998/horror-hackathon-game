extends Area2D

# This handles the click
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Box clicked! Swapping scene...")
			get_tree().change_scene_to_file("res://path_to_your_minigame.tscn")

# You can keep this if you want something to happen when the player walks close
func _on_body_entered(body):
	if body.name == "player":
		print("Player is close enough to interact!")
		var player_is_near = false

func _on_body_entered(body):
	if body.name == "player":
		player_is_near = true

func _on_body_exited(body):
	if body.name == "player":
		player_is_near = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and player_is_near:
		get_tree().change_scene_to_file("res://path_to_your_minigame.tscn")
