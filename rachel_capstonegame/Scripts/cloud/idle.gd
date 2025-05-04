extends State


func tick(delta):
	juese.follower_creator()
	if Input.is_action_just_pressed("J"):
		state_root.trans_state("fall")
		return

func enter_state():
	pass
	
func exit_state():
	pass


func Animation_end(name):
	if state_root.now_state == self.name and name == now_animation:
		pass
