extends AiEntity

func _physics_process(delta):
	pass

func process_chase():
	if can_see($"/root/Global".gamemanager.player) and $"/root/Global".gamemanager.player.position.distance_to(position)<500:
		target=$"/root/Global".gamemanager.get_navpath(position,$"/root/Global".gamemanager.player.position.move_toward(position,96))[1]
	else:
		new_state(EntitiState.PATROL)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
