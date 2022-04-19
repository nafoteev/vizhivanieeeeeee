extends LivingEntiti
class_name Player

func _ready():
	#print($)
	#$"/root/Global".gamemanager.player = self
	pass

func entity_calculate_target_velocity()->Vector2:
	#print ("123")
	return speed * Input.get_vector("left ", "right", "up", "down")

# warning-ignore:unused_argument
func _physics_process(delta):
	look_at(get_global_mouse_position())
func _on_Area2D_body_entered(_body):
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
