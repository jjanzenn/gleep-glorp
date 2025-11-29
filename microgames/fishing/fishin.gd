extends Node2D

var idle_time = 1.5
var max_active_time = 4
var elapsed = 0

var presses = 0
var press_threshold = 13

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") and elapsed > idle_time and elapsed < max_active_time:
		presses += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	if elapsed > idle_time and elapsed < max_active_time:
		$"screen-active".visible = true
		$"screen-idle".visible = false
		$"instructions".visible = true
	elif elapsed > max_active_time and presses >= press_threshold:
		$"screen-active".visible = false
		$"screen-idle".visible = false
		$"screen-success".visible = true
	elif elapsed > max_active_time:
		$"screen-active".visible = false
		$"screen-idle".visible = true
		$"screen-success".visible = false
