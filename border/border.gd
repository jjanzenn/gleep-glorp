extends Node2D

var lives: int = 4
var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if $Microgame/root.won:
		print("win :))")
		score += 1
		$Score.text = str(score)
	else:
		print("fail :((")
		match lives:
			1:
				$"Lives/Life 1/AnimationPlayer".play("explod")
			2:
				$"Lives/Life 2/AnimationPlayer".play("explod")
			3:
				$"Lives/Life 3/AnimationPlayer".play("explod")
			4:
				$"Lives/Life 4/AnimationPlayer".play("explod")
		lives -= 1
