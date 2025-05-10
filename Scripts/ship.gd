extends Node2D

@onready var spawner = $Spawner as Spawner
@onready var left_cannon = $LeftCannon
@onready var right_cannon = $RightCannon
@onready var fire_rate_timer = $FireRateTimer
@onready var scale_objects = $Scale as ScaleObjects

var speed: float = 100.0

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	if direction.length() > 0:
		direction = direction.normalized()

	position += direction * speed * delta

func fire_lasers() -> void:
	spawner.spawn(left_cannon.global_position)
	spawner.spawn(right_cannon.global_position)
	scale_objects.tween_scale()
