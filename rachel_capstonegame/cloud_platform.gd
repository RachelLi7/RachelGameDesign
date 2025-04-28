extends Area2D

@export var move_speed: float = 150.0 # 左右移动速度
@export var fall_speed: float = 300.0 # 下落速度
@export var move_range: float = 200.0 # 左右移动范围
@export var scroll_speed: float = 100.0 # 屏幕右推速度

var start_position: Vector2
var moving_right: bool = true
var is_falling: bool = false

func _ready():
	start_position = global_position

func _physics_process(delta):
	# 不管是移动还是掉落，都要往右漂移（跟随镜头）
	# global_position.x += scroll_speed * delta

	if not is_falling:
		global_position.x +=scroll_speed * delta
		
	if is_falling:
		# 正在下落
		global_position.y += fall_speed * delta
	else:
		# 左右来回移动
		if moving_right:
			global_position.x += move_speed * delta
			if global_position.x >= start_position.x + move_range:
				moving_right = false
		else:
			global_position.x -= move_speed * delta
			if global_position.x <= start_position.x - move_range:
				moving_right = true

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and not is_falling:
			is_falling = true

func _on_MovingPlatform_body_entered(body):
	if is_falling:
		is_falling = false
		set_physics_process(false) # 停止一切动作，固定下来
