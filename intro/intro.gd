extends Node2D

var in_intro: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action") and in_intro:
		in_intro = false
		$AudioStreamPlayer.stop()
		add_child(preload("res://border/border.tscn").instantiate())
