# Give the component a class name so it can be instanced as a custom node
class_name StatsComponent
extends Node

# Export the health variable and connect a setter to manage health changes
@export var health: int = 1:
	set(value):
		health = value
		
		# Emit a signal when the health value changes
		health_changed.emit()
		
		# Emit a signal when health reaches 0
		if health == 0:
			no_health.emit()

# Define signals to notify about health changes
signal health_changed() # Emit when the health value changes
signal no_health() # Emit when there is no health left
