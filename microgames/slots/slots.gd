extends Node2D

var will_win = false

var animation_speed = 0.2

var animation_time = 0

var done_1 = 0
var done_2 = 0
var done_3 = 0

var s1 = 0
var s2 = 0
var s3 = 0

func set_icon(value, parent: Node2D) -> void:
	if value % 2 == 0:
		parent.get_node("transition").visible = true
		parent.get_node("heart").visible = false
		parent.get_node("ufo").visible = false
		parent.get_node("gleep").visible = false
	elif value == 1:
		parent.get_node("transition").visible = false
		parent.get_node("heart").visible = true
		parent.get_node("ufo").visible = false
		parent.get_node("gleep").visible = false
	elif value == 3:
		parent.get_node("transition").visible = false
		parent.get_node("heart").visible = false
		parent.get_node("ufo").visible = true
		parent.get_node("gleep").visible = false
	elif value == 5:
		parent.get_node("transition").visible = false
		parent.get_node("heart").visible = false
		parent.get_node("ufo").visible = false
		parent.get_node("gleep").visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animation_time += delta
	
	if Input.is_action_just_pressed("action"):
		$paw.visible = true
	elif Input.is_action_just_released("action"):
		$paw.visible = false
		if not done_3:
			animation_speed /= 2
			if not done_1:
				if s1 % 2 == 0:
					s1 = (s1 + 1) % 6
				set_icon(s1, $"slot-1")
				done_1 = true
			elif not done_2:
				s2 = s1
				set_icon(s2, $"slot-2")
				done_2 = true
			else:
				if will_win:
					s3 = s1
				else:
					s3 = (s1 + 2) % 6
				set_icon(s3, $"slot-3")
				done_3 = true

	if animation_time > animation_speed:
		if not done_1:
			s1 = (s1 + 1) % 6
			set_icon(s1, $"slot-1")
		if not done_2:
			s2 = (s2 + 1) % 6
			set_icon(s2, $"slot-2")
		if not done_3:
			s3 = (s3 + 1) % 6
			set_icon(s3, $"slot-3")
		animation_time = 0
