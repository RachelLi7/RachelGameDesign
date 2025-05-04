extends Node
class_name State

var 是否进入状态 = false
var now_animation = ""
var exist_time = 0
var state_root:State_root = null
var juese:Node2D = null
func _ready():
	state_root = get_parent()
	juese = state_root.get_parent()

	

func run(delta):
	if not 是否进入状态:
		是否进入状态 = true
		#当某些条件判断不满足时返回
		if 基类_进入状态() == false:
			return
		exist_time = 0
	if state_root.是否播放动画 == true:
		if state_root.是否有动画节点:
			if state_root.动画节点.has_animation(now_animation):
				state_root.动画节点.play(now_animation)
			else:
				state_root.动画节点.stop()
	exist_time += delta
	tick(delta)
	
func 基类_进入状态():
	var 运行结果 =  enter_state()
	if state_root.是否有动画节点:
		if state_root.动画节点.has_animation(now_animation):
			state_root.动画节点.seek(0)
	return 运行结果
	
func 基类_退出状态():
	是否进入状态 = false
	exit_state()
	pass

func exit_state():
	pass
	
func enter_state():
	pass
	
func tick(delta):
	pass

func 重置():
	是否进入状态 = false
