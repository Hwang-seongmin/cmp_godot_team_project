extends Area2D

signal soul_collected

# When the player touches the soul, the touched soul disappears
func _on_soul_body_entered(body):
	if body.name == "Player":
		queue_free()
		emit_signal("soul_collected")
