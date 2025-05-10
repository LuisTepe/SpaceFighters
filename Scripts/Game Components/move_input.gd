# Define the MoveInput class to handle user input and update object movement
class_name MoveInput
extends Node

# Reference to the MoveObjects instance to update its velocity based on input
@export var move_objects: MoveObjects

# Reference to the MoveStats instance to use its speed value
@export var move_stats: MoveStats

# Called when an input event is detected
func _input(event: InputEvent) -> void:
	# Get the input axis values for left and right movement
	var input_axis = Input.get_axis("ui_left", "ui_right")
	# Update the velocity of the move_objects based on the input axis and move_stats speed
	move_objects.velocity = Vector2(input_axis * move_stats.speed, 0)
