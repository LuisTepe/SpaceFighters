extends Node2D

# Export the scenes to be spawned
@export var EnemyScene: PackedScene
@export var YellowBugScene: PackedScene
@export var RedEnemyScene:PackedScene

# Define margin and screen width
var margin = 8
var screen_width = ProjectSettings.get_setting("display/window/size/viewport_width")

# Reference to the Spawner component
@onready var spawner = $Spawner as Spawner

# Reference to the base enemy spawn timer
@onready var base_enemy_spawn_timer = $BaseEnemySpawnTimer
# Reference to the yellow bug spawn timer
@onready var red_enemy_spawn_timer = $RedEnemySpawnTimer
# Reference to the yellow bug spawn timer
@onready var yellow_bug_spawn_timer = $YellowBugSpawnTimer

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the timeout signal of the base enemy spawn timer to the handle_spawn method
	base_enemy_spawn_timer.timeout.connect(handle_spawn.bind(EnemyScene, base_enemy_spawn_timer))
	
	# Connect the timeout signal of the yellow bug spawn timer to the handle_spawn method
	yellow_bug_spawn_timer.timeout.connect(handle_spawn.bind(YellowBugScene, yellow_bug_spawn_timer))
	# Connect the timeout signal of the red bug spawn timer to the handle_spawn method
	red_enemy_spawn_timer.timeout.connect(handle_spawn.bind(RedEnemyScene, red_enemy_spawn_timer))

# Function to handle spawning enemies
func handle_spawn(enemy_scene: PackedScene, timer: Timer) -> void:
	# Set the scene to be spawned
	spawner.scene = enemy_scene
	# Spawn the scene at a random position along the x-axis, just above the screen
	spawner.spawn(Vector2(randf_range(margin, screen_width - margin), -16))
	# Restart the timer
	timer.start()
