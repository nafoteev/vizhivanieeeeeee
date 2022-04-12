extends Node
class_name GameManager
var player:KinematicBody2D
var entities := []
#var player : Player
func get_navpath(a,b):
	var navigation = $Navigation2D
	return navigation.get_simple_path(a,b)

func update_entiti_list()->void:
	entities = []
	for node in get_children():
		if node is LivingEntiti:
			register_entity(node as LivingEntiti)

func select_target(entity : LivingEntiti) -> LivingEntiti:
	update_entiti_list()
	var target : LivingEntiti
	var best_distance :float = INF
	for other in entities:
		if other is LivingEntiti:
			if entity.is_enemy(other) and entity.can_see(other):
				var distance = entity.position.distance_to(other.position)
				if best_distance > distance:
					target = other
					best_distance = distance
	return target

func register_entity(entity : LivingEntiti) -> void:
	if entity and not entities.has(entity): 
		entities.append(entity)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Global".gamemanager = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
