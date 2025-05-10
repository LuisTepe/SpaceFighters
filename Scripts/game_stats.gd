# Define the GameStats class to manage game statistics
class_name GameStats
extends Resource

# Export the score variable and connect a setter to emit a signal when the score changes
@export var score = 0:
	set(value):
		score = value
		score_changed.emit(score)

# Export the highscore variable
@export var highscore: int = 0

# Signal emitted when the score changes
signal score_changed(new_score)
