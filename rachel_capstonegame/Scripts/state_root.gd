extends Node
class_name State_root

@export var play_animation = true

func _ready():
	if character.has_node("AnimationPlayer"):
		has_animation_player = true
		animation_player = character.get_node("AnimationPlayer")
		for child in get_children():
			if child.has_method("Animation_end"):
				if not animation_player.is_connected("animation_finished",child.Animation_end):
					animation_player.connect("animation_finished", child.Animation_end)
	if not tree_entered.is_connected(_on_tree_entered):
		tree_entered.connect(_on_tree_entered)

#动态添加新节点
func add_new_state(node:State):
	add_child(node)
	if node.has_method("Animation_end"):
		if not animation_player.is_connected("animation_finished",node.Animation_end):
			animation_player.connect("animation_finished", node.Animation_end)

func remove_state(node:State):
	if node.has_method("Animation_end"):
		if animation_player.is_connected("animation_finished",node.Animation_end):
			animation_player.disconnect("animation_finished", node.Animation_end)
	remove_child(node)



var has_animation_player = false
var animation_player:AnimationPlayer = null
var last_state = null
var now_state = "idle"
@onready var character = $".."

func run(delta):
	if not has_node(now_state):
		return
	var child = get_node(now_state)
	if child != null:
		#if child.has_method("run"):
			child.run(delta)
			return
	#角色.animation_player.play("站立")

func trans_state(state_name):
	if now_state != null:
		for child in get_children():
			if child.name ==  now_state :
				child.	on_exit_state()
	
	last_state = now_state
	now_state = state_name
	return
	
func _on_tree_entered():
	for child in get_children():
		if child.has_method("_on_tree_entered"):
			child._on_tree_entered()
			
func get_state_node(name):
	return get_node(name)
