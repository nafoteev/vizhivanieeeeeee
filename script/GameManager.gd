extends Node
class_name GameManager
var player:KinematicBody2D
#var player : Player
func get_navpath(a,b):
	var navigation = $Navigation2D
	return navigation.get_simple_path(a,b)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
