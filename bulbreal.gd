extends Sprite2D

const FRAME_OFF = 13
const FRAME_ON = 21

func _ready():
	frame = FRAME_OFF 

func turn_on():
	frame = FRAME_ON 
