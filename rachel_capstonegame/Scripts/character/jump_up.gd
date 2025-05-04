extends State


func tick(delta):
	juese.move_ment()
	if exist_time >= 0.3:
		if juese.is_on_floor():
			state_root.trans_state("idle")

func enter_state():
	now_animation = "jump up"
	juese.velocity.y = -60
	
func exit_state():
	pass


func Animation_end(name):
	if state_root.now_state == self.name and name == now_animation:
		if now_animation == "jump up":
			now_animation = "jump"
