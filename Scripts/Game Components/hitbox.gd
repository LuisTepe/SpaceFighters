# Define the Hitbox class to handle collision detection and damage dealing
class_name Hitbox
extends Area2D

# Export the amount of damage this hitbox will deal
@export var damage = 1.0

# Signal emitted when this hitbox collides with a hurtbox
signal hit_hurtbox(hurtbox)

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Connect the area_entered signal to the _on_hurtbox_entered method
	area_entered.connect(_on_hurtbox_entered)

# Method to handle collision with another area
func _on_hurtbox_entered(hurtbox: Hurtbox) -> void:
	# Ensure the colliding area is a hurtbox
	if not hurtbox is Hurtbox: return
	# Ensure the hurtbox is not invincible
	if hurtbox.is_invincible: return
	# Emit the hit_hurtbox signal indicating a collision with a hurtbox
	hit_hurtbox.emit(hurtbox)
	# Notify the hurtbox that it has been hit
	hurtbox.hurt.emit(self)
