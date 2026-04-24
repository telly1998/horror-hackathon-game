extends AnimatedSprite2D

@onready var anim = $AnimatedSprite2D

func set_idle():
	anim.play("idle")

func set_walk():
	anim.play("walk")

func set_hurt():
	anim.play("hurt")
