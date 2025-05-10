extends Node2D

# Reference to the VisibleOnScreenNotifier2D component
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

# Reference to the ScaleObjects component
@onready var scale_objects = $Scale as ScaleObjects

# Reference to the Hitbox component
@onready var hitbox = $Hitbox as Hitbox

# Reference to the ShootingSound component
@onready var shooting_sound = $ShootingSound

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Activate the scaling effect
	scale_objects.tween_scale()
	
	# Connect the screen_exited signal to the queue_free method to remove the node when it leaves the screen
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
	# Connect the hit_hurtbox signal to the queue_free method to remove the node when it hits a hurtbox
	hitbox.hit_hurtbox.connect(queue_free.unbind(1))
	
	# Play the shooting sound effect
	if shooting_sound:
		shooting_sound.play()

# Optional: If you want to play the sound effect again at a different time or on a specific event
func play_shooting_sound() -> void:
	if shooting_sound:
		shooting_sound.play()
