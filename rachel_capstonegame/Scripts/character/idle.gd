extends State


func tick(delta):
	if juese.move_ment() == true:
		state_root.trans_state("walk")
		return

	if Input.is_action_just_pressed("W") and juese.is_on_floor():
		state_root.trans_state("jump")
		return

func enter_state():
	now_animation = "idle"
	
func exit_state():
	pass


func Animation_end(name):
	if state_root.now_state == self.name and name == now_animation:
		pass
