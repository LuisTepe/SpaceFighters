# Give the component a class name so it can be instanced as a custom node
class_name MoveObjects
extends Node

# Reference to the actor node that this component will control
@export var actor: Node2D

# The velocity at which the actor will move
@export var velocity: Vector2

# Called every frame to update the actor's position based on the velocity
func _process(delta: float) -> void:
	# Translate the actor's position by the velocity scaled by the frame's delta time
	actor.translate(velocity * delta)
