# Created by Gwang Jin Kim, Sung min Hwang
extends Node2D

var fists = []
var scene_fist
var num_fists = 10
var y = -250

signal lose_health

func _ready():
	scene_fist = load("res://Scenes/Fist.tscn")
	
	# Create fists initially
	for i in range(num_fists):
		fists.append(scene_fist.instance())
		fists[i].position = Vector2(100 + i*400, y)
		add_child(fists[i])
		emit_signal("lose_health")

func _process(delta):
	# Create fists repeatedly
	for i in range(num_fists):
		if (!is_instance_valid(fists[i])):
			fists.clear()
			_ready()
