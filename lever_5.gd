extends Area2D

# Define the signal
signal lever_pulled

@onready var sprite = $Sprite2D
var is_pulled = false
@export var lever_id: int # Set this in the Inspector to 1, 2, 3, etc.

func _on_lever_pulled():
	if lever_id == Gamemanager.correct_lever_id:
		print("Correct lever pulled!")
		# Trigger the success animation or function here
	else:
		print("Wrong lever, try again.")
func pull_lever():
	if is_pulled: return # Don't pull it twice
	is_pulled = true
	sprite.frame = 20
	# Tell the world: "I was pulled!"
	lever_pulled.emit() 

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		pull_lever()
