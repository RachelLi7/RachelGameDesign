extends Node2D

class_name CloudManager

# 常量
const CLOUD_TEXTURES = [
	preload("res://Assets/cloud platform/Cloud 1.png"),
	preload("res://Assets/cloud platform/Cloud 3.png"),
	preload("res://Assets/cloud platform/Cloud 4.png"),
	preload("res://Assets/cloud platform/Cloud 7.png"),
	preload("res://Assets/cloud platform/Cloud 10.png"),
]

const CLOUD_SCENE = preload("res://cloud platform.tscn")

# 变量
# @onready var state_root: State_root = $state_root
var move_dir = Vector2(1, 0)
var current_state = "idle"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("cloud_creator")
	randomize()
	
	if has_node("Cloud1"):
		$Cloud1.texture = CLOUD_TEXTURES.pick_random()
	
	current_state = "idle"
	# state_root.now_state = "idle"
	
	start_position = position.x
	
	# 等待一下再开始创建新的云
	# await get_tree().create_timer(0.1).timeout
	# create_new_cloud()

# Called every frame
func _physics_process(delta: float) -> void:
	move(delta)

# 创建新的云朵
# func create_new_cloud() -> void:
	 # var new_cloud = CLOUD_SCENE.instantiate()
	 # new_cloud.global_position = Vector2(100000, 100000) # 初始位置
	 # get_tree().get_first_node_in_group("map").add_child(new_cloud)
	
	
# cloud move left and right
@export var cloud_distence = 200
@export var speed = 1
var start_position

func move(delta: float) -> void:
	position.x += speed
	if position.x >= start_position + cloud_distence:
		speed = -speed
	elif position.x <= start_position - cloud_distence:
		speed = -speed  
	

# 当云朵离开屏幕时
func _on_visible_screen_notifier_2d_screen_exited() -> void:
	move_dir.x *= -1
