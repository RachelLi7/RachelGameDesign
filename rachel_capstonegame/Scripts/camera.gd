extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("camera")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += delta*Vector2(30,0)



func trans(screen_point:Vector2) -> Vector2:
	var inv_canv_tfm: Transform2D = self.get_canvas_transform().affine_inverse()
	var half_screen: Transform2D = Transform2D().translated(screen_point)
	var actual_screen_center_pos: Vector2 = inv_canv_tfm * half_screen * Vector2.ZERO
	return actual_screen_center_pos
