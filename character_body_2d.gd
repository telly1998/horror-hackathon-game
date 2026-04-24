extends CharacterBody2D

@export var speed: float = 400.0
@onready var anim = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
	
	# Add the animation logic back here
	update_animation()

func update_animation():
	if velocity == Vector2.ZERO:
		anim.stop()
		return

	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			anim.play("right")
		else:
			anim.play("left")
	else:
		if velocity.y > 0:
			anim.play("down")
		else:
			anim.play("up")
