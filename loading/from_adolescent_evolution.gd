extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		_on_animation_player_animation_finished("")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().root.add_child(preload("res://border/adolescent-border.tscn").instantiate())
	queue_free()
