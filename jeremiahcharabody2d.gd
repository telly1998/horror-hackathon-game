extends CharacterBody2D

enum State { CALM, RESTLESS, CHASING }
var current_state = State.CALM

@export var speed_chase = 150
@onready var player = get_node("/root/MainScene/Player") # Adjust this path!

func _process(delta):
	# 1. Update the state based on losses
	update_state()
	
	# 2. Perform behavior based on the current state
	match current_state:
		State.CALM:
			velocity = Vector2.ZERO # Stay still
		
		State.RESTLESS:
			# Move slowly and randomly
			velocity = Vector2(cos(Time.get_ticks_msec() * 0.002) * 20, 0)
		
		State.CHASING:
			# Calculate direction toward player
			var direction = (player.global_position - global_position).normalized()
			velocity = direction * speed_chase
			
	move_and_slide()

func update_state():
	# Escalation thresholds
	if GameManager.loss_count > 10:
		current_state = State.CHASING
	elif GameManager.loss_count > 3:
		current_state = State.RESTLESS
	else:
		current_state = State.CALM
