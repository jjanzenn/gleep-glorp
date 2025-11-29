extends Node2D

var rng = RandomNumberGenerator.new()

const card_1x = 102
const card_2x = 124
const card_3x = 146
const dealer_y = 137
const player_y = 170

var number1 = 1

var loser_number_1
var loser_number_2
var loser_number_3
var loser_sum

var winner_number_1
var winner_number_2
var winner_number_3 = 1
var wn_1_score
var wn_2_score
var wn_3_score = 1

var will_win = true

func spawn_card(value, x, y, parent) -> void:
	var sprite = Sprite2D.new()
	parent.add_child(sprite)
	match value:
		1:
			sprite.texture = load("res://microgames/blackjack/card-1.png")
		2:
			sprite.texture = load("res://microgames/blackjack/card-2.png")
		3:
			sprite.texture = load("res://microgames/blackjack/card-3.png")
		4:
			sprite.texture = load("res://microgames/blackjack/card-4.png")
		5:
			sprite.texture = load("res://microgames/blackjack/card-5.png")
		6:
			sprite.texture = load("res://microgames/blackjack/card-6.png")
		7:
			sprite.texture = load("res://microgames/blackjack/card-7.png")
		8:
			sprite.texture = load("res://microgames/blackjack/card-8.png")
		9:
			sprite.texture = load("res://microgames/blackjack/card-9.png")
		10:
			sprite.texture = load("res://microgames/blackjack/card-10.png")
		11:
			sprite.texture = load("res://microgames/blackjack/card-j.png")
		12:
			sprite.texture = load("res://microgames/blackjack/card-q.png")
		13:
			sprite.texture = load("res://microgames/blackjack/card-k.png")
		_:
			sprite.texture = load("res://microgames/blackjack/card-back.png")
	sprite.position.x = x
	sprite.position.y = y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loser_number_1 = rng.randi_range(2, 8)
	loser_number_2 = rng.randi_range(2, 6)
	loser_number_3 = rng.randi_range(2, 6)
	loser_sum = loser_number_1 + loser_number_2 + loser_number_3
	
	winner_number_1 = rng.randi_range(2, 13)
	if winner_number_1 >= 10:
		wn_1_score = 10
	else:
		wn_1_score = winner_number_1
	winner_number_2 = loser_sum - wn_1_score
	if winner_number_2 >= 10:
		wn_2_score = 10
	else:
		wn_2_score = winner_number_2
		
	if will_win:
		spawn_card(winner_number_1, card_1x, player_y, $"player-cards")
		spawn_card(winner_number_2, card_2x, player_y, $"player-cards")
		spawn_card(-1, card_3x, player_y, $"player-cards")
	else:
		spawn_card(loser_number_1, card_1x, player_y, $"player-cards")
		spawn_card(loser_number_2, card_2x, player_y, $"player-cards")
		spawn_card(-1, card_3x, player_y, $"player-cards")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
