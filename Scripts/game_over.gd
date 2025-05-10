extends Control

# Export the game stats to display and update scores
@export var game_stats: GameStats

# Reference to the UI elements for displaying score and high score
@onready var score_value = %ScoreValue
@onready var high_score_value = %HighScoreValue

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Update the high score if the current score is greater
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	
	# Display the current score and high score on the UI
	score_value.text = str(game_stats.score)
	high_score_value.text = str(game_stats.highscore)

# Process function to handle input for returning to the main menu
func _process(delta: float) -> void:
	pass
	# Check if the "ui_accept" action is pressed
	if Input.is_action_just_pressed("ui_accept"):
		# Reset the game score to 0
		game_stats.score = 0
		# Change the scene back to the main menu
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
