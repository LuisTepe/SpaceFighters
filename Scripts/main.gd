extends Node2D

# Export the game stats to manage the game score and related data
@export var game_stats: GameStats

# Reference to the ship node
@onready var ship = $Ship

# Reference to the score label node
@onready var score_label = $ScoreLabel

@onready var background_song = $MainSong

var game_finished = false

var enemiesKilled = 0
# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Initialize a random seed
	randomize()
	
	# Update the score label with the current score
	update_score_label(game_stats.score)
	
	# Connect the score_changed signal from game_stats to the update_score_label method
	game_stats.score_changed.connect(update_score_label)
	
	if background_song:
		background_song.play() 
	
	# Connect the tree_exiting signal from the ship to an anonymous function
	ship.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Game_Over.tscn")
		)
		
# Function to update the score label with the new score

func update_score_label(new_score: int) -> void:
	if game_finished:
		return
	
	score_label.text = "Score " + str(new_score)
	enemiesKilled += 1
	if enemiesKilled >= 20:
		game_finished = true
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/game_win.tscn")
