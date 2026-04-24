extends Node
var loss_count = 0 
var correct_lever_id: int
func increment_losses():
	loss_count += 1
	print("Losses: ", loss_count)

func _ready():
	# Randomly pick a number (e.g., 1 to 5)
	correct_lever_id = randi_range(1, 5)
	print("The correct lever is: ", correct_lever_id)
	# Inside gamemanager.gd
var last_position = Vector2.ZERO # Store map data here
