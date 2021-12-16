extends Node2D

# the screen gradually brightens on a dark screen
func _ready():
	$AnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(4),"timeout")
	$AnimationPlayer.play("Fadeout2")
	yield(get_tree().create_timer(3),"timeout")
	get_tree().change_scene("res://Intro/Intro_start.tscn")
