extends Node2D

@onready var bulb = $bulb 

func _ready():
	# Connect signals from your levers
	# Ensure the node names match exactly in your scene tree
	var levers = [$Lever1, $Lever2, $Lever3, $Lever4, $Lever5]
	for i in range(levers.size()):
		levers[i].lever_pulled.connect(_on_lever_pulled.bind(i))

func _on_lever_pulled(lever_id):
	# Call the logic centralized in the GameManager
	# This keeps your minigame code clean and bug-free
	Gamemanager.process_lever_input(lever_id)

# Call this if the player runs out of time or fails another way
func _on_player_lost_game():
	Gamemanager.increment_losses()
	get_tree().change_scene_to_file("res://lossscreen.tscn")
func _on_retry_pressed():
	get_tree().change_scene_to_file("res://maingame.tscn")
