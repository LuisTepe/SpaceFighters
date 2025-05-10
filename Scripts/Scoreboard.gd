extends Node

var high_scores = []

# Call this function to update the scoreboard with the current score
func update_scoreboard(current_score):
	high_scores.append(current_score)
	high_scores.sort()
	high_scores.reverse()
	high_scores = high_scores.slice(0, 10)  # Keep only the top 10 scores
	print("High Scores: ", high_scores)

# Display the high scores
func display_high_scores():
	print("High Scores: ", high_scores)
