extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Cloud1.texture = [CLOUD_1,CLOUD_3,CLOUD_4,CLOUD_7,CLOUD_10].pick_random()
	state_root.now_state ="idle"





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	state_root.run(delta)

@onready var state_root: State_root = $state_root

const CLOUD_1 = preload("res://Assets/cloud platform/Cloud 1.png")
const CLOUD_3 = preload("res://Assets/cloud platform/Cloud 3.png")
const CLOUD_4 = preload("res://Assets/cloud platform/Cloud 4.png")
const CLOUD_7 = preload("res://Assets/cloud platform/Cloud 7.png")
const CLOUD_10 = preload("res://Assets/cloud platform/Cloud 10.png")

func follower_creator():
	var cloud_creator:Node2D = get_tree().get_first_node_in_group("cloud_creator")
	global_position = cloud_creator.global_position
	
func create_new_cloud():
	var cloud_creator:Node2D = get_tree().get_first_node_in_group("cloud_creator")
	cloud_creator.create_new_cloud()
	
func fall(delta):
	global_position += Vector2(0,1)*delta*Vector2(0,120)
