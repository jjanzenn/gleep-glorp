extends Microgame

var rng = RandomNumberGenerator.new()
var food_index

const animation_time = 0.2
var elapsed = 0

var done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	food_index = rng.randi_range(0, 3)
	match food_index:
		0:
			$"instruction/instruction-rock".visible = true
		1:
			$"instruction/instruction-salt".visible = true
		2:
			$"instruction/instruction-broccollii".visible = true
		3:
			$"instruction/instruction-hamburger".visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("a"):
		won = food_index == 3
		done = true
	elif Input.is_action_pressed("b"):
		won = food_index == 2
		done = true
	elif Input.is_action_pressed("x"):
		won = food_index == 0
		done = true
	elif Input.is_action_pressed("y"):
		won = food_index == 1
		done = true
		
	if done and won:
		$happy.visible = true
		elapsed += delta
		if elapsed > animation_time:
			$"happy/frame-1".visible = not $"happy/frame-1".visible
			$"happy/frame-2".visible = not $"happy/frame-2".visible
			elapsed = 0
	elif done:
		$angy.visible = true
		elapsed += delta
		if elapsed > animation_time:
			$"angy/frame-1".visible = not $"angy/frame-1".visible
			$"angy/frame-2".visible = not $"angy/frame-2".visible
			elapsed = 0
