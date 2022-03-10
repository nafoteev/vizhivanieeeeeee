extends "res://script/LivingEntiti.gd"
class_name AiEntity
export var visibility:NodePath
var gamemanager
var target:=Vector2()
func _physics_process(delta):
	match state:
		EntitiState.INACTIVE:
			process_inactive()
		EntitiState.PATROL:
			process_patrol()
		EntitiState.ALIVE:
			process_alive()
		EntitiState.CHASE:
			process_chase()
	
	
func process_chase():
	pass
func process_alive():
	pass
func process_patrol():
	pass
func process_inactive():
	var v = get_node_or_null(visibility)as VisibilityNotifier2D
	if v.is_on_screen():
		new_state(EntitiState.PATROL)
#	target=gamemanager.get_navpath(position,gamemanager.player.position)[1]
#func entity_calculate_target_velocity():
#	return position.direction_to(target)*speed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
