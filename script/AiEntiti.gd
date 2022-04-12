extends "res://script/LivingEntiti.gd"
var chase_target:LivingEntiti  
var patrol_timer = Timer.new()
export var visibility_distance = 250

class_name AiEntity
export var visibility:NodePath
var GameManager
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
	if check_visual_contact(gamemanager.player) and gamemanager.player.position.distance_to(position)<500:
		target=gamemanager.get_navpath(position,gamemanager.player.position)[1]
	else:
		new_state(EntitiState.PATROL)
func process_alive():
	new_state(EntitiState.INACTIVE)
func process_patrol():
	var target_candidate = $"/root/Global".gamemanager.select_target(self)
	if target_candidate:
		new_state(EntitiState.CHASE)
		chase_target = target_candidate

func process_inactive():
	var v = get_node_or_null(visibility)as VisibilityNotifier2D
	if v.is_on_screen():
		new_state(EntitiState.PATROL)
func entity_calculate_target_velocity() -> Vector2:
	var dist = position.distance_to(target)
	var vel = position.direction_to(target)*min(speed,dist*10)
	return vel
	
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(patrol_timer)
	patrol_timer.connect("timeout",self,"update_target_patrol")
	pass # Replace with function body.
func update_target_patrol():
	target = position+Vector2(rand_range(-20,20),rand_range(-20,20))
func new_state(new_value):
	.new_state(new_value)
	if new_value == EntitiState.PATROL:
		patrol_timer.start(5)
	elif new_value != EntitiState.PATROL:
		patrol_timer.stop()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
