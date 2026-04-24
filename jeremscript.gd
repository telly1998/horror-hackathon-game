extends CharacterBody2D

enum State { CALM, RESTLESS, CHASING }
var current_state = State.CALM

@export var speed_chase := 150.0

var player: Node2D

@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D


func _ready():
	$AnimatedSprite2D.frame = 1

	# safer: find player dynamically (avoids export mis-assignments)
	player = get_tree().get_first_node_in_group("player")

	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 8.0


func _physics_process(delta):
	if not is_instance_valid(player):
		return

	# ALWAYS update target every frame
	nav_agent.target_position = player.global_position

	update_state()

	match current_state:
		State.CALM:
			velocity = Vector2.ZERO

		State.RESTLESS:
			velocity = Vector2(cos(Time.get_ticks_msec() * 0.002) * 20.0, 0)

		State.CHASING:
			chase_player()

	move_and_slide()


func chase_player():
	if nav_agent.is_navigation_finished():
		velocity = Vector2.ZERO
		return

	var next_pos = nav_agent.get_next_path_position()
	var dir = next_pos - global_position

	if dir.length() > 0.01:
		velocity = dir.normalized() * speed_chase
	else:
		velocity = Vector2.ZERO


func update_state():
	if Gamemanager.loss_count > 1:
		if current_state != State.CHASING and not chase_triggered:
			chase_triggered = true
			start_minigame()
		current_state = State.CHASING
	elif Gamemanager.loss_count > 0:
		current_state = State.RESTLESS
	else:
		current_state = State.CALM
func start_minigame():
	get_tree().change_scene_to_file("res://minigame.tscn")
var chase_triggered := false
