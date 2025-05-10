# Give the component a class name so it can be instanced as a custom node
class_name IsHurt
extends Node

# Reference to the stats component to modify the health
@export var stats_component: StatsComponent

# Reference to the hurtbox to detect when the actor is hit
@export var hurtbox: Hurtbox

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the hurt signal from the hurtbox to an anonymous function
	# that reduces health by the damage amount from the hitbox
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		stats_component.health -= hitbox.damage
	)
