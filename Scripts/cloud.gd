extends Area2D


export var speed : int = 50
export var moveDist : int = 1000
 
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
