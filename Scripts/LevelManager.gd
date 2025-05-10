extends Node

var level = 1

# Call this function to start a new level
func start_level():
	print("Starting Level: ", level)
	# Implement level start logic, like spawning enemies
	increase_difficulty()

# Increase game difficulty with each level
func increase_difficulty():
	# Adjust difficulty settings
	print("Increasing difficulty for Level: ", level)
