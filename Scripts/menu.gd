extends Control

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	pass
	# Check if the "ui_accept" action is pressed
	if Input.is_action_just_pressed("ui_accept"):
		# Change the scene to the main menu scene
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
