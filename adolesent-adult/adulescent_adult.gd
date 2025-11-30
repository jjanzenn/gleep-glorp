extends Node2D

var frame_time = 0.2
var elapsed = 0
var frame = 0

var child_frame = 0

var super_frame_time = 0.5
var super_elapsed = 0
var super_frame = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	super_elapsed += delta
	if elapsed > frame_time:
		frame = (frame + 1) % 3
		elapsed = 0
		
	if super_elapsed > super_frame_time:
		super_frame = (super_frame + 1) % 2
		$adolescent.visible = not $adolescent.visible
		$adult.visible = not $adult.visible
		super_elapsed = 0 
	
	if frame == 0:
		$"adolescent/adolescent-0".visible = true
		$"adolescent/adolescent-1".visible = false
		$"adolescent/adolescent-2".visible = false
	elif frame == 1:
		$"adolescent/adolescent-0".visible = false
		$"adolescent/adolescent-1".visible = true
		$"adolescent/adolescent-2".visible = false
	elif frame == 2:
		$"adolescent/adolescent-0".visible = false
		$"adolescent/adolescent-1".visible = false
		$"adolescent/adolescent-2".visible = true
