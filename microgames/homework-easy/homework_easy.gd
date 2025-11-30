extends Microgame

var x
var y
var result
var answers = []
var rng = RandomNumberGenerator.new()

var done = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	x = rng.randi_range(1, 12)
	y = rng.randi_range(1, 12)
	result = x * y
	for i in range(3):
		var w = rng.randi_range(1, 144)
		if w == result:
			w += 1
		answers.append(w)
	answers.append(result)
	answers.shuffle()
	$question.text = "{0} x {1} = ?".format([x, y])
	$"answer-a".text = "{0}".format([answers[0]])
	$"answer-b".text = "{0}".format([answers[1]])
	$"answer-x".text = "{0}".format([answers[2]])
	$"answer-y".text = "{0}".format([answers[3]])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !done:
		if Input.is_action_pressed("a"):
			won = answers[0] == result
			$question.text = "{0} x {1} = {2}".format([x, y, answers[0]])
			done = true
		elif Input.is_action_pressed("b"):
			won = answers[1] == result
			$question.text = "{0} x {1} = {2}".format([x, y, answers[1]])
			done = true
		elif Input.is_action_pressed("x"):
			won = answers[2] == result
			$question.text = "{0} x {1} = {2}".format([x, y, answers[2]])
			done = true
		elif Input.is_action_pressed("y"):
			won = answers[3] == result
			$question.text = "{0} x {1} = {2}".format([x, y, answers[3]])
			done = true
			
	if done and won:
		$"A+".visible = true
	elif done and not won:
		$F.visible = true
