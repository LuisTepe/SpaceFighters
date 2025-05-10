# Give the component a class name so it can be instanced as a custom node
class_name IsDestroyed
extends Node

# Export the actor this component will operate on
@export var actor: Node2D

# Grab access to the stats so we can tell when the health has reached zero
@export var stats_component: StatsComponent

# Export and grab access to a spawner component so we can create an effect on death
@export var destroy_effect_spawner_component: Spawner

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the no_health signal from the stats component to the destroy method
	stats_component.no_health.connect(destroy)

# Method to handle the destruction of the actor
func destroy() -> void:
	# Spawn a destruction effect at the actor's position using the spawner component
	destroy_effect_spawner_component.spawn(actor.global_position)
	# Remove the actor from the scene
	actor.queue_free()
