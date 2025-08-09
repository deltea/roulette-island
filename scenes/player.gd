class_name Player extends CharacterBody2D

@export var speed = 50.0

@onready var sprite: Sprite2D = $Sprite

func _ready() -> void:
	pass

func _process(dt: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * speed

	if direction != Vector2.ZERO:
		sprite.rotation_degrees = sin(Time.get_ticks_msec() / 50.0) * 12.0
	else:
		sprite.rotation_degrees = 0.0

	move_and_slide()
