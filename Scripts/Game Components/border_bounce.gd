# Define the BorderBounce class to make the actor bounce off screen borders
class_name BorderBounce
extends Node

# Margin to allow actors to bounce before reaching the screen edges
@export var margin: = 8

# Reference to the actor node that this component will control
@export var actor: Node2D

# Reference to the move component to change the actor's velocity upon bouncing
@export var move_objects: MoveObjects

# Define the screen borders for the bouncing logic
var left_border = 0
# Get the right border of the screen from the display settings
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

# Process method called every frame to handle bouncing logic
func _process(delta: float) -> void:
	# Check if the actor's position is beyond the left border plus margin
	if actor.global_position.x < left_border + margin:
		# Prevent the actor from moving beyond the left border plus margin
		actor.global_position.x = left_border + margin
		# Bounce off the left wall by reversing the velocity's x component
		move_objects.velocity = move_objects.velocity.bounce(Vector2.RIGHT)
	# Check if the actor's position is beyond the right border minus margin
	elif actor.global_position.x > right_border - margin:
		# Prevent the actor from moving beyond the right border minus margin
		actor.global_position.x = right_border - margin
		# Bounce off the right wall by reversing the velocity's x component
		move_objects.velocity = move_objects.velocity.bounce(Vector2.LEFT)

