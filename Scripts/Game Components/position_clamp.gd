# Give the component a class name so it can be instanced as a custom node
class_name PositionClamp
extends Node2D

# Export the actor whose position will be clamped within screen borders
@export var actor: Node2D

# Export a margin for left and right (margin.x) and top and bottom (margin.y)
@export var margin: = 8

# Define the left border as 0
var left_border = 0
# Use the display viewport width to get the right border of the screen
var right_border = ProjectSettings.get_setting("display/window/size/viewport_width")

# Called every frame to update the actor's position based on the defined borders
func _process(delta: float) -> void:
	# Clamp the x position of the actor between the left border and the right border (accounting for the margin)
	actor.global_position.x = clamp(actor.global_position.x, left_border + margin, right_border - margin)
