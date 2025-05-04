extends CharacterBody2D

class_name Player


@onready var state_root: State_root = $state_root



func _ready() -> void:
	add_to_group("character")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += 90 * delta
	else:
		pass
	
	if not state_root.now_state in ["fall","die"]:
		change_dir()
	move_and_slide()
	state_root.run(delta)


	
func move_ment():
	var dir = Input.get_axis("left","right")
	if dir:
		velocity.x = dir * 60
		return true
	else:
		velocity.x = 0
		return false
		

func change_dir():
	var dir = Input.get_axis("left","right")
	if dir > 0:
		$pic.scale.x = 1
	elif  dir < 0:
		$"pic".scale.x = -1


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().get_first_node_in_group("map").gameover.show()
