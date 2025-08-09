class_name Player extends CharacterBody2D

@export var speed = 50.0
@export var tilemap: TileMapLayer

@onready var sprite: Sprite2D = $Sprite
@onready var selection: Sprite2D = $Selection

func _ready() -> void:
	pass

func _process(dt: float) -> void:
	selection.position = selection.position.lerp(get_tile_pos(get_global_mouse_position()), 20 * dt)

func _physics_process(dt: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * speed

	if direction != Vector2.ZERO:
		sprite.rotation_degrees = sin(Time.get_ticks_msec() / 50.0) * 12.0
	else:
		sprite.rotation_degrees = 0.0

	move_and_slide()

func get_tile_pos(pos: Vector2) -> Vector2:
	return tilemap.local_to_map(tilemap.to_local(pos)) * 16.0 + Vector2(8, 8)
