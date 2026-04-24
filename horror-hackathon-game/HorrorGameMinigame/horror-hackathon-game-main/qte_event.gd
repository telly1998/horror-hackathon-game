extends Node

@onready var Background = $Background
@onready var Pointer = $Pointer
@onready var Start = $Start
@onready var End = $End
@onready var SafeStartPos = $SafeStartPos
@onready var SafEendPos = $SafeEndPos

var direction = 8 # Right Position

func _process(delta: float) -> void: #Cross Movement
	
	if Pointer.position.x <= Start.position.x:
		direction = 8
	elif Pointer.position.x >= End.position.x:
		direction = -8
	
	Pointer.position.x += direction
	
	if Input.is_action_pressed("ui_accept"): #
		if Pointer.position.x >= SafeStartPos.position.x and Pointer.position.x <= SafeEndEnd.position.x:
			# Door shut and minigame complete script
			
			
