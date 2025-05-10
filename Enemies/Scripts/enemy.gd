# Define the Enemy class to manage enemy behavior
class_name Enemy
extends Node2D

# Reference to Destroyed 
@onready var destroyed = $Destroyed as IsDestroyed

# Reference to the Hitbox 
@onready var hitbox = $Hitbox as Hitbox

# Reference to Hurt 
@onready var enemy_is_hurt = $EnemyIsHurt as IsHurt

# Reference to the Hurtbox 
@onready var hurtbox = $Hurtbox as Hurtbox

# Reference to MoveObjects 
@onready var move = $Move as MoveObjects

# Reference to ScaleObjects 
@onready var scale_objects = $Scale as ScaleObjects

# Reference to the Score 
@onready var score = $Score as Score

# Reference to Shake
@onready var shake = $Shake as Shake

# Reference to the Stats 
@onready var game_stats = $GameStats as StatsComponent

# Reference to the VisibleOnScreenNotifier2D 
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the no_health signal from stats to adjust_score method of score
	game_stats.no_health.connect(func():
		score.adjust_score()
	)
	
	# Connect the screen_exited signal to queue_free to remove the node when it leaves the screen
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
	# Connect the hurt signal from hurtbox to a custom function to handle scaling and shaking
	hurtbox.hurt.connect(func(hitbox: Hitbox):
		scale_objects.tween_scale()
		shake.tween_shake()
	)
	
	# Connect the no_health signal from stats to queue_free to remove the node when health is zero
	game_stats.no_health.connect(queue_free)
	
	# Connect the hit_hurtbox signal from hitbox to the destroy method of destroyed
	hitbox.hit_hurtbox.connect(destroyed.destroy.unbind(1))
