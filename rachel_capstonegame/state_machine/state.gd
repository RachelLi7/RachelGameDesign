extends Node
class_name State

var has_entered_state = false
var now_animation = ""
var exist_time = 0
var state_root:State_root = null
var juese:Node2D = null
func _ready():
	state_root = get_parent()
	juese = state_root.get_parent()

	

func run(delta):
	if not has_entered_state:
		has_entered_state = true
		#当某些条件判断不满足时返回
		if 	on_enter_state() == false:
			return
		exist_time = 0
	if state_root.play_animation == true:
		if state_root.has_animation_player:
			if state_root.animation_player.has_animation(now_animation):
				state_root.animation_player.play(now_animation)
			else:
				state_root.animation_player.stop()
	exist_time += delta
	tick(delta)
	
func 	on_enter_state():
	var result =  enter_state()
	if state_root.has_animation_player:
		if state_root.animation_player.has_animation(now_animation):
			state_root.animation_player.seek(0)
	return result
	
func 	on_exit_state():
	has_entered_state = false
	exit_state()
	pass

func exit_state():
	pass
	
func enter_state():
	pass
	
func tick(delta):
	pass

func reset():
	has_entered_state = false
