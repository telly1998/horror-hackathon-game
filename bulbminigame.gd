extends Node2D

@onready var bulb = $bulb # Look at your scene tree: the node is named 'bulb' (lowercase)

signal finished(success: bool)

var correct_lever := 0

# Define your frame indices
const FRAME_OFF = 0
const FRAME_ON = 1

func _ready():
	correct_lever = randi() % 5
	print("Correct lever is: ", correct_lever)
	
	# Set to off by default
	bulb.frame = FRAME_OFF
	
	var levers = [$Lever1, $Lever2, $Lever3, $Lever4, $Lever5]
	for i in range(levers.size()):
		levers[i].lever_pulled.connect(_on_lever_pulled.bind(i))

func _on_lever_pulled(lever_index: int):
	if lever_index == correct_lever:
		print("Correct lever pulled!")
		win()
	else:
		print("Wrong lever! Nothing happens.")
		# We don't call fail() to change the frame, 
		# so the bulb stays as it is.
		emit_signal("finished", false)

func win():
	bulb.frame = FRAME_ON
	emit_signal("finished", true)
