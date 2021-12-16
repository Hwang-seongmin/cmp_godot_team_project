extends Area2D

signal lose_health

# When a player touches it, the player's health is reduced by three.
func _on_Fire_body_entered(body):
	if body.name == "Player":
		body.health -= 3
		emit_signal("lose_health")
