extends Sprite2D

const FRAME_OFF = 13
const FRAME_SUCCESS = 21

func _ready():
	frame = FRAME_OFF

# This function is now safe because it is part of the Sprite2D
func turn_on():
	frame = FRAME_SUCCESS

func _on_lever_1_lever_pulled() -> void:
	if Gamemanager.correct_lever == 0: # Note: Indices usually start at 0
		turn_on()
	else:
		Gamemanager.increment_losses()

func _on_lever_2_lever_pulled() -> void:
	if Gamemanager.correct_lever == 1:
		turn_on()
	else:
		Gamemanager.increment_losses()
