# Created by Gwang Jin Kim

extends KinematicBody2D

class_name Player


var walk_speed = 300
var jump_speed = 600
var gravity = 20
var velocity = Vector2()
var friction = 0.4
var health = 3

func is_dead() -> bool:
	if (health <= 0):
		return true
	else:
		return false

func get_input():
	# Movements
	velocity.y += gravity
	if Input.is_action_pressed("ui_right"):
		velocity.x = walk_speed
		$Sprite.play("walk")
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -walk_speed
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
		
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jump_speed
		$JumpSound.play()

func _physics_process(delta):
	get_input()
	if(is_dead()):
		get_tree().reload_current_scene()
	
	velocity.x = lerp(velocity.x, 0, friction) # smooth stop
	velocity = move_and_slide(velocity, Vector2.UP)
