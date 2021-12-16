extends Area2D

signal lose_health

export var speed : int = 80
export var moveDist : int = 150
 
onready var startX : float = position.x
onready var targetX : float = position.x + moveDist

func _physics_process (delta):
	
	# Move to the "targetX" position
	position.x = move_to(position.x, targetX, speed * delta)
 
	# If we're at our target, move in the other direction
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX


# Moves "current" towards "to" in an increment of "step"
func move_to (current, to, step):
 
	var new = current
 
	# Are we moving positive?
	if new < to:
		new += step
 
		if new > to:
			new = to
	# Are we moving negative?
	else:
		new -= step
 
		if new < to:
			new = to
 
	return new

# When a player touches it, the player's health is reduced by one
func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.health -= 1
		emit_signal("lose_health")
