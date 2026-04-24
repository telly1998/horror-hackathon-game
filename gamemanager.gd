extends Node

# Variables tracked by the Singleton
var win_count: int = 0
var loss_count: int = 0
var lever_wins: int = 0
var qte_wins: int = 0
var correct_lever_id: int = -1

func _ready():
	reset_round()

# --- Logic Methods ---

func process_lever_input(lever_id: int):
	if lever_id == correct_lever_id:
		increment_lever_wins()
		if check_victory():
			get_tree().change_scene_to_file("res://winscreen.tscn")
		else:
			reset_round()
			# Instead of reload_current_scene(), which is destructive,
			# you might consider just emitting a signal to update your UI.
			get_tree().reload_current_scene()
	else:
		increment_losses()
		get_tree().change_scene_to_file("res://lossscreen.tscn")

func check_victory() -> bool:
	return lever_wins >= 4 or qte_wins >= 1

func reset_round():
	# Use randi() % 5 for an integer range of 0 to 4
	correct_lever_id = randi() % 5 
	print("New correct lever: ", correct_lever_id)

func reset_game():
	lever_wins = 0
	qte_wins = 0
	reset_round()

# --- Incremental Helpers ---

func increment_wins():
	win_count += 1

func increment_losses():
	loss_count += 1

func increment_lever_wins():
	lever_wins += 1

func increment_qte_wins():
	qte_wins += 1
