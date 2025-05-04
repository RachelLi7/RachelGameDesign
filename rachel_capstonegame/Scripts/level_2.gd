extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("map")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if get_tree().get_node_count_in_group("star") == 0:
		get_tree().change_scene_to_file("res://Scene/lose_2.tscn")
	else: 
		get_tree().change_scene_to_file("res://Scene/success_2.tscn")


func _on_falling_area_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://Scene/lose_2.tscn")
