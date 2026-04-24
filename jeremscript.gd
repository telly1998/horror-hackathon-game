extends CharacterBody2D

enum State { CALM, RESTLESS, CHASING }
var current_state = State.CALM

@export var speed_chase = 150.0
@onready var player = get_node("/root/maingame/joseph")

func _ready():
	$Sprite2D.frame = 1 

func _physics_process(delta):
	# 1. Update state first
	update_state()
	
	# 2. Determine velocity based on current state
	var velocity = Vector2.ZERO
	
	match current_state:
		State.CALM:
			velocity = Vector2.ZERO
		
		State.RESTLESS:
			velocity = Vector2(cos(Time.get_ticks_msec() * 0.002) * 20, 0)
			
		State.CHASING:
			var direction = (player.global_position - global_position).normalized()
			velocity = direction * speed_chase
	
	# 3. Apply movement using move_and_collide for solid, non-pushable physics
	# We multiply velocity by delta to ensure movement is frame-rate independent
	move_and_collide(velocity * delta)

func update_state():
	if Gamemanager.loss_count > 4:
		current_state = State.CHASING
	elif Gamemanager.loss_count > 2:
		current_state = State.RESTLESS
	else:
		current_state = State.CALM
