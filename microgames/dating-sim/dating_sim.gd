extends Microgame

var rng = RandomNumberGenerator.new()
var done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	won = rng.randi_range(0, 1) == 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("a"):
		done = true
		$"phone-screen/message-2/option-a".visible = true
	elif Input.is_action_just_pressed("b"):
		done = true
		$"phone-screen/message-2/option-a".visible = true
	elif Input.is_action_just_pressed("x"):
		done = true
		$"phone-screen/message-2/option-x".visible = true
	elif Input.is_action_just_pressed("y"):
		done = true
		$"phone-screen/message-2/option-y".visible = true
		
	if done:
		$options.visible = false
		$"phone-screen/message-2".visible = true
		$"phone-screen/message-3".visible = true
		if won:
			$"phone-screen/message-3/label-win".visible = true
		else:
			$"phone-screen/message-3/label-lose".visible = true
