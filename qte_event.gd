extends Node

@onready var Background = $Background
@onready var Pointer = $Pointer
@onready var Start = $Start
@onready var End = $End
@onready var SafeStartPos = $SafeStartPos
@onready var SafeEndPos = $SafeEndPos

var speed = 8 # Changed 'direction' to 'speed' for clarity
var direction = 1 # Added a variable to handle +1 or -1 movement
var stopped := false

func _process(delta: float) -> void:

	# Move pointer back and forth
	if not stopped:
		# Reverse direction at boundaries
		if Pointer.position.x <= Start.position.x:
			direction = 1
		elif Pointer.position.x >= End.position.x:
			direction = -1

		# Apply movement
		Pointer.position.x += direction * speed * delta * 60

	# Check input
	if Input.is_action_just_pressed("ui_accept") and not stopped:
		stopped = true

		# Check if the pointer is within the safe zone
		if Pointer.position.x >= SafeStartPos.position.x and Pointer.position.x <= SafeEndPos.position.x:
			get_tree().change_scene_to_file("res://winscreen.tscn")
		else:
			get_tree().change_scene_to_file("res://lossscreen.tscn")
func _on_qte_success():
	Gamemanager.increment_qte_wins()
	
	if Gamemanager.check_victory():
		get_tree().change_scene_to_file("res://winscreen.tscn")
	else:
		get_tree().change_scene_to_file("res://maingame.tscn")
func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://maingame.tscn")
