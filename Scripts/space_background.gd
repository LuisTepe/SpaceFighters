extends ParallaxBackground

# Reference to the space layer
@onready var space_layer = $SpaceLayer

# Reference to the far stars layer
@onready var far_stars_layer = $FarStarsLayer

# Reference to the close stars layer
@onready var close_stars_layer = $CloseStarsLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move the space layer downwards slowly
	space_layer.motion_offset.y += 2 * delta
	# Move the far stars layer downwards at a medium speed
	far_stars_layer.motion_offset.y += 5 * delta
	# Move the close stars layer downwards quickly
	close_stars_layer.motion_offset.y += 20 * delta
	pass
