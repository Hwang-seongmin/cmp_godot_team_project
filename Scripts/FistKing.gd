# Created by Gwang Jin Kim
extends "res://Scripts/Fist.gd"

var speed = 380

# Make player to lose health
func _on_FistKing_body_entered(body):
	if body.name == "Player":
			body.health -= 1
			queue_free()
	else:
		queue_free()

# Make fist move
func _physics_process(delta):
	position.x -= speed * delta
	position.y -= speed * delta
