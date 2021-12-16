# Created by Gwang Jin Kim
# This player has sliding
extends Player

class_name SlidngPlayer

export (PackedScene) var Projectile

onready var end_of_player = $EndOfPlayer

func _ready():
	walk_speed = 250
	health = 100
	friction = 0.04

func _unhandled_input(event) -> void:
	if event.is_action_pressed("shoot"):
		shoot()

# Make projectile dynamically
func shoot():
	var projectile_instance = Projectile.instance()
	get_parent().add_child(projectile_instance)
	projectile_instance.global_position = end_of_player.global_position
	$"ShootSound".play()
