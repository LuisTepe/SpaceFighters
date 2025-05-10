# Give the component a class name so it can be instanced as a custom node
class_name ScaleObjects
extends Node

# Export the sprite that this component will be scaling
@export var sprite: Node2D

# Export the scale amount as a vector
@export var scale_amount = Vector2(1.5, 1.5)

# Export the scale duration
@export var scale_duration: = 0.4

# This is the function that will activate the scaling effect
func tween_scale() -> void:
	# Create a tween for smooth scaling transitions
	var tween = create_tween().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	# Scale the sprite from its current scale to the scale amount over 1/10th of the scale duration
	tween.tween_property(sprite, "scale", scale_amount, scale_duration * 0.1).from_current()
	
	# Scale the sprite back to its original scale (1, 1) for the remaining 9/10ths of the scale duration
	# Note: This assumes the sprite starts with a scale of (1, 1). If it starts with a different scale,
	# you may want to store the initial scale value and use it here instead.
	tween.tween_property(sprite, "scale", Vector2.ONE, scale_duration * 0.9).from(scale_amount)
