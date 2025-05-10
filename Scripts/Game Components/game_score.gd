# Give the component a class name so it can be instanced as a custom node
class_name Score
extends Node

# Export the game stats to manipulate the game score
@export var game_stats: GameStats

# Export the amount by which the score should be adjusted
@export var adjust_amount = 5

# Function to adjust the game score. By default, it uses adjust_amount,
# but a different amount can be passed as an argument if needed.
func adjust_score(amount: int = adjust_amount):
	game_stats.score += amount
