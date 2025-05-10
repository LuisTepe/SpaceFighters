# Give the component a class name so it can be instanced as a custom node
class_name OneTimeAnimatedEffect

# This effect exports an animated sprite so we can assign a sprite frames resource for animation
# and connect to the animation_finished signal to free the node when the animation completes
extends AnimatedSprite2D

@onready var explotion_sound = $explotionSound

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the animation_finished signal to the queue_free method to remove the node when the animation ends
	animation_finished.connect(queue_free)
	
	# Connect the animation_looped signal to the queue_free method to remove the node when the animation loops
	animation_looped.connect(queue_free)
	
	if explotion_sound:
			explotion_sound.play()
