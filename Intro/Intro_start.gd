extends Node2D

var start = false
# the screen gradually brightens on a dark screen
func _ready():
	while(!start):
		$AnimationPlayer.play("FadeIn")
		yield(get_tree().create_timer(3),"timeout")
		$AnimationPlayer.play("FadeOut")
		yield(get_tree().create_timer(3),"timeout")
# when the gameuser pressed start button, then move to stage1 scene.
func _on_Start_pressed():
	get_tree().change_scene("res://Hells/HellOfViolence.tscn")
# when the gameuser pressed Control button, then move to Control scene.
func _on_Control_pressed():
	get_tree().change_scene("res://Intro/Intro_control.tscn")
# when the gameuser pressed Story button, then move to Story scene.
func _on_Story_pressed():
	get_tree().change_scene("res://Intro/Intro_des.tscn")
