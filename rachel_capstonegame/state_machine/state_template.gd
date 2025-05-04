extends State


func tick(delta):

	pass

func enter_state():
	pass
	
func exit_state():
	pass


func Animation_end(name):
	if state_root.now_state == self.name and name == now_animation:
		pass
