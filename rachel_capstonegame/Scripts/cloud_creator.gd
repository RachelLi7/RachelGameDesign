extends Node2D

class_name Cloud_creator
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("cloud_creator")
	await get_tree().create_timer(0.1).timeout
	create_new_cloud()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move(delta)


const CLOUD = preload("res://Scene/cloud platform.tscn")
func create_new_cloud():
	var new_cloud = CLOUD.instantiate()
	new_cloud.global_position = Vector2(100000,100000)
	get_tree().get_first_node_in_group("map").add_child(new_cloud)
	
var move_dir = Vector2(1,0)
func move(delta):
	var camera = get_tree().get_first_node_in_group("camera")
	var left_pos = camera.trans(Vector2(0,0))
	var right_pos = camera.trans(Vector2(1200,0))
	if move_dir == Vector2(1,0):
		global_position += move_dir*delta*Vector2(150,0)
		return
	elif move_dir == Vector2(-1,0):
		global_position += move_dir*delta*Vector2(150,0)
		return
	
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	move_dir.x *= -1
