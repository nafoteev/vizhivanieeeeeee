extends KinematicBody2D

var activated = false

var speed = 200

func _physics_process(delta):
	if activated:
		var player = $"/root/Global".player as KinematicBody2D
		if player and player.alive:
			look_at(player.global_position)
			move_and_slide((player.global_position - global_position).normalized()*7500*delta)
			if position.distance_to(player.position) < 40.8:
				get_tree().reload_current_scene()
	else:
			 # activated = $VisibilityNotifier2D.is_on_screen()
			pass
