extends LivingEntiti
class_name Player

func _ready():
	gamemanager.player = self


func entity_calculate_target_velocity()->Vector2:
	print ("123")
	return speed * Input.get_vector("left ", "right", "up", "down")

func _physics_process(delta):
	look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
