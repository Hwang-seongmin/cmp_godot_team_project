extends Area2D

signal lose_health

# When a player touches it, the player's health is reduced by five. 
func _on_ice_body_entered(body):
	if body.name == "Player":
		body.health -= 5
		emit_signal("lose_health")
