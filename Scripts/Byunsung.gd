# Created by Gwang Jin Kim
extends StaticBody2D

class_name Byunsung

export (PackedScene) var FistKing

const min_souls = 500
const MaxFireDelay = .25
var health = 100
var fireDelay

onready var end_of_byunsung = $EndOfByunsung

func _ready():
	fireDelay = MaxFireDelay

# Check for death
func is_dead() -> bool:
	if (health <= 0):
		return true
	else:
		return false

func _physics_process(delta):
	if is_dead():
		if $"../HUD".souls >= 500:
			get_tree().change_scene("res://Scenes/EndScene.tscn")
		else:
			get_tree().reload_current_scene()
	
	# Create fist regularly
	if fireDelay < 0:
		shoot()
	else:
		fireDelay -= .5 * delta

# Set health to new value
func set_health(damage):
	self.health -= damage
	$"../HealthBar/ProgressBar".set_bar_value(self.health)
	
	if self.health > 0:
		$DamagedBossSound.play()

# Create fist dynamically
func shoot():
	var fist_king_instance = FistKing.instance()
	get_parent().add_child(fist_king_instance)
	fist_king_instance.global_position = end_of_byunsung.global_position
	fireDelay = MaxFireDelay
