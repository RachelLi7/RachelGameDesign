extends State


func tick(delta):
	juese.fall(delta)
	if Input.is_action_just_pressed("J"):
		state_root.trans_state("stop")
		return

func enter_state():
	pass
	
func exit_state():
	pass


func Animation_end(name):
	if state_root.now_state == self.name and name == now_animation:
		pass
