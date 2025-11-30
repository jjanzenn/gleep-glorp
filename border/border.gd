extends Node2D

var lives: int = 4
var score: int = 0
var childhood_games = []
var game_indices = [0, 1, 2, 3]
var game_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	childhood_games.append(preload("res://microgames/petting/petting.tscn"))
	childhood_games.append(preload("res://microgames/feeding/feeding.tscn"))
	childhood_games.append(preload("res://microgames/fishing/root.tscn"))
	childhood_games.append(preload("res://microgames/scrub/scrub.tscn"))

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
		if score == 10:
			get_tree().root.add_child(preload("res://child-adolescent/child-adolescent.tscn").instantiate())
			queue_free()
		else:
			var new_game_index = game_indices.pick_random()
			while game_index == new_game_index:
				new_game_index = game_indices.pick_random()
			game_index = new_game_index
			
			$Microgame.add_child(childhood_games[game_index].instantiate())
			$timer/AnimationPlayer.play("timer")
