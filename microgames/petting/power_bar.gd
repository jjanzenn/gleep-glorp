extends Microgame

var frame_time = 0.2

var direction = 1
var state = 1
var time_total = 0
var done = false
var really_done = false
var running = true
var accepting_input = false

var animation_frame_time = 0.15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if accepting_input:
		if Input.is_action_just_released("action"):
			done = true
			if state == 4:
				won = true
			else:
				won = false
	if !Input.is_action_pressed("action"):
		accepting_input = true
		
	if state == 0:
		$"power-bar/stage-0".visible = true
		$"power-bar/stage-1".visible = false
		$"power-bar/stage-2".visible = false
		$"power-bar/stage-3".visible = false
		$"power-bar/stage-4".visible = false
	elif state == 1:
		$"power-bar/stage-0".visible = false
		$"power-bar/stage-1".visible = true
		$"power-bar/stage-2".visible = false
		$"power-bar/stage-3".visible = false
		$"power-bar/stage-4".visible = false
	elif state == 2:
		$"power-bar/stage-0".visible = false
		$"power-bar/stage-1".visible = false
		$"power-bar/stage-2".visible = true
		$"power-bar/stage-3".visible = false
		$"power-bar/stage-4".visible = false
	elif state == 3:
		$"power-bar/stage-0".visible = false
		$"power-bar/stage-1".visible = false
		$"power-bar/stage-2".visible = false
		$"power-bar/stage-3".visible = true
		$"power-bar/stage-4".visible = false
	elif state == 4:
		$"power-bar/stage-0".visible = false
		$"power-bar/stage-1".visible = false
		$"power-bar/stage-2".visible = false
		$"power-bar/stage-3".visible = false
		$"power-bar/stage-4".visible = true
		
		
	time_total += delta
	if time_total > frame_time and not done:
		if state == 4:
			direction = -1
		elif state == 1:
			direction = 1
		state += direction
		time_total = 0
	elif done and not really_done:
		$"gleep-glorp".visible = false
		if state == 4:
			$happy.visible = true
		else:
			$angy.visible = true
		really_done = true
	elif time_total > animation_frame_time and state == 4 and really_done:
		$"happy/frame-1".visible = not $"happy/frame-1".visible
		$"happy/frame-2".visible = not $"happy/frame-2".visible
		time_total = 0
	elif time_total > animation_frame_time and really_done:
		$"angy/frame-1".visible = not $"angy/frame-1".visible
		$"angy/frame-2".visible = not $"angy/frame-2".visible
		time_total = 0
