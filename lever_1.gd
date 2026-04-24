extends Area2D

# Define the signal
signal lever_pulled

@onready var sprite = $Sprite2D
var is_pulled = false

func pull_lever():
	if is_pulled: return # Don't pull it twice
	is_pulled = true
	sprite.frame = 16
	# Tell the world: "I was pulled!"
	lever_pulled.emit() 

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		pull_lever()
