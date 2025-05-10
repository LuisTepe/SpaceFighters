extends Node

var score = 0

# Call this function to update the score
func update_score(points):
	score += points
	print("Current Score: ", score)
	check_level_up()

# Check if the player should level up based on the score
func check_level_up():
	if score >= level * 1000:
		level += 1
		print("Level Up! New Level: ", level)
		LevelManager.increase_difficulty()  # Call the function from LevelManager

# Reset the score for a new game
func reset_score():
	score = 0
	print("Score reset to: ", score)
