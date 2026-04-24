extends Node

var win_count = 0
var loss_count = 0
var lever_wins = 0
var qte_wins = 0
var correct_lever_id: int

func _ready():
	reset_round()

func increment_wins():
	win_count += 1
	print("Total Wins: ", win_count)

func increment_losses():
	loss_count += 1
	print("Total Losses: ", loss_count)

func increment_lever_wins():
	lever_wins += 1
	print("Lever Wins: ", lever_wins)

func increment_qte_wins():
	qte_wins += 1
	print("QTE Wins: ", qte_wins)

func reset_round():
	correct_lever_id = randi_range(0, 4)

func check_victory() -> bool:
	return lever_wins >= 4 or qte_wins >= 1

func reset_game():
	lever_wins = 0
	qte_wins = 0
	reset_round()

# This is the logic you should call from your lever script
func process_lever_input(lever_id: int):
	if lever_id == correct_lever_id:
		increment_lever_wins()
		
		if check_victory():
			get_tree().change_scene_to_file("res://winscreen.tscn")
		else:
			reset_round()
			get_tree().reload_current_scene()
	else:
		increment_losses()
		get_tree().change_scene_to_file("res://lossscreen.tscn")
