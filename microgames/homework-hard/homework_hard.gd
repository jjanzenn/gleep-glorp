extends Microgame


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	won = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("a"):
		$TextEdit.text += "a"
	if Input.is_action_pressed("b"):
		$TextEdit.text += "b"
	if Input.is_action_pressed("x"):
		$TextEdit.text += "x"
	if Input.is_action_pressed("y"):
		$TextEdit.text += "y"
	pass
