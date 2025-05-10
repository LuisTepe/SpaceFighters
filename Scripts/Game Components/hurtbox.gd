# Define the Hurtbox class to handle collision detection and invincibility
class_name Hurtbox
extends Area2D

# Boolean to track invincibility status with a custom setter to manage collision shapes
var is_invincible = false:
	# Inline setter to disable or enable collision shapes based on invincibility status
	set(value):
		is_invincible = value
		# Iterate over all children of this node
		for child in get_children():
			# Ensure the child is a CollisionShape2D or CollisionPolygon2D
			if not child is CollisionShape2D and not child is CollisionPolygon2D:
				continue
			# Use set_deferred to change the disabled state of collision shapes outside the physics process
			child.set_deferred("disabled", is_invincible)

# Signal emitted when this hurtbox is hit by a hitbox
signal hurt(hitbox)
