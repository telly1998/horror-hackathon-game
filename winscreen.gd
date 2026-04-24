extends Control

# If you have a button in your Loss Screen, connect its "pressed" signal here
func _on_return_button_pressed():
	# Optional: Reset the loss count if you want a fresh start
	# GameManager.loss_count = 0
	
	# Switch back to the main game
	get_tree().change_scene_to_file("res://maingame.tscn")
