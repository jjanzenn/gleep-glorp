extends Node2D

var lives: int = 4
var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_animation_finished(_anim_name: StringName) -> void:
	if _anim_name == "timer":
		$Microgame/root.queue_free()
		
		if $Microgame/root.won:
			$AnimationPlayer.play("win")
			score += 1
			$Score.text = str(score)
		else:
			match lives:
				1:
					$"Lives/Life 1/AnimationPlayer".play("explod")
				2:
					$"Lives/Life 2/AnimationPlayer".play("explod")
				3:
					$"Lives/Life 3/AnimationPlayer".play("explod")
				4:
					$"Lives/Life 4/AnimationPlayer".play("explod")
			if lives > 1:
				$AnimationPlayer.play("lose")
			else:
				$AnimationPlayer.play("game_over")
			lives -= 1
			


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print("waiter waiter one more game please")
	
	if anim_name == "win" or anim_name == "lose":
		$Microgame.add_child(preload("res://microgames/fishing/root.tscn").instantiate())
		$timer/AnimationPlayer.play("timer")
