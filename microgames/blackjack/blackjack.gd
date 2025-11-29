extends Microgame

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

var will_win = true

var player_card_1
var player_card_2
var player_card_3
var dealer_card_1
var dealer_card_2
var dealer_card_3

var done = false
var done_for_real = false

var elapsed = 0
var total_elapsed = 0
var animation_time = 0.2
var animation_stop = 1.75

func spawn_card(value, x, y, parent) -> void:
	var sprite = Sprite2D.new()
	parent.add_child(sprite)
	match value:
		1:
			sprite.texture = load("res://microgames/blackjack/card-a.png")
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
	
	winner_number_1 = rng.randi_range(7, 13)
	var wn_1_score = winner_number_1
	if winner_number_1 >= 10:
		wn_1_score = 10
	winner_number_2 = loser_sum - wn_1_score
	if winner_number_2 < 1:
		winner_number_2 = 1
		
	if will_win:
		player_card_1 = winner_number_1
		player_card_2 = winner_number_2
		player_card_3 = winner_number_3
		dealer_card_1 = loser_number_1
		dealer_card_2 = loser_number_2
		dealer_card_3 = loser_number_3
	else:
		player_card_1 = loser_number_1
		player_card_2 = loser_number_2
		player_card_3 = loser_number_3
		dealer_card_1 = winner_number_1
		dealer_card_2 = winner_number_2
		dealer_card_3 = winner_number_3
		
	spawn_card(player_card_1, card_1x, player_y, $"player-cards")
	spawn_card(player_card_2, card_2x, player_y, $"player-cards")
	spawn_card(-1, card_3x, player_y, $"player-cards")
		
	spawn_card(dealer_card_1, card_1x, dealer_y, $"scalar-cards")
	spawn_card(-1, card_2x, dealer_y, $"scalar-cards")
	spawn_card(-1, card_3x, dealer_y, $"scalar-cards")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	total_elapsed += delta
	if elapsed > animation_time and total_elapsed < animation_stop:
		$"background-2".visible = not $"background-2".visible
		elapsed = 0
	if not done:
		if Input.is_action_pressed("action"):
			spawn_card(player_card_3, card_3x, player_y, $"player-cards")
			done = true
			total_elapsed = 0
		if Input.is_action_pressed("cancel"):
			done = true
			total_elapsed = 0
	if done:
		won = will_win
		spawn_card(dealer_card_2, card_2x, dealer_y, $"scalar-cards")
		spawn_card(dealer_card_3, card_3x, dealer_y, $"scalar-cards")
		$instructions.visible = false
		if not $AudioStreamPlayer.playing and not done_for_real:
			$AudioStreamPlayer.play()
			done_for_real = true
		if will_win:
			$"win-text".visible = true
		else:
			$"lose-text".visible = true
