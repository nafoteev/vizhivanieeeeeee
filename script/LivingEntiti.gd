extends KinematicBody2D
class_name LivingEntiti
export var HP:int=20 setget entity_HP_changed
export var Max_HP:int=20
func entity_HP_changed(new_value):
	HP=clamp(new_value,0,Max_HP)
export var speed:float = 400
export var acceleration:float=2000
var velocity:Vector2 
func entity_calculate_target_velocity()->Vector2:
	return Vector2()
func entity_move(target_vel:Vector2,delta:float):
	velocity = velocity.move_toward(target_vel,acceleration*delta)
	velocity = move_and_slide(velocity)


enum EntitiState{
		DEAD=0,
		INACTIVE=1,
		ALIVE=2,
		PATROL=3,
		CHASE=4,
}

export(EntitiState) var state = EntitiState.INACTIVE setget new_state
func new_state(new_value):
	state=new_value
	
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
