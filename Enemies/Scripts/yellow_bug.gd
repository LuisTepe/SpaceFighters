extends Enemy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	move.velocity.x = [-175, 175].pick_random()
	
