extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("star")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
