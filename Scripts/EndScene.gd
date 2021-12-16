# Created by Gwang Jin Kim
extends Node2D

var end = false

func _ready():
	$KilledBossSound.play()
	# Make "You Win" blink
	# the screen gradually brightens on a dark screen
	while(!end):
		$AnimationPlayer.play("FadeIn")
		yield(get_tree().create_timer(3),"timeout")
		$AnimationPlayer.play("FadeOut")
		yield(get_tree().create_timer(3),"timeout")

# Go to start scene
func _on_Retry_pressed():
	get_tree().change_scene("res://Intro/Intro_start.tscn")

# Quit the game
func _on_Quit_pressed():
	get_tree().quit()
