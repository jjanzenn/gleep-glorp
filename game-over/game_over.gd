extends Node2D

var animation_time = 0.2
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta
	if time > animation_time:
		$"bg-1".visible = not $"bg-1".visible
		$"bg-2".visible = not $"bg-2".visible
		time = 0
	pass
