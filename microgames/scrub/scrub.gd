extends Microgame

var elapsed = 0
var animation_time = 0.2

var dust_sprites = []
var curr_dust = 0
const rang = 70
const num_dust = 15

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0, num_dust):
		var new_sprite = Sprite2D.new()
		$dust.add_child(new_sprite)
		new_sprite.texture = load("res://microgames/scrub/dust.png")
		new_sprite.position.x = rng.randi_range($gleep.position.x - rang, $gleep.position.y + rang)
		new_sprite.position.y = rng.randi_range($gleep.position.y - rang, $gleep.position.y + rang)
		dust_sprites.append(new_sprite)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	elapsed += delta
	if elapsed > animation_time:
		$joystick.visible = not $joystick.visible
		$"joystick-2".visible = not $"joystick-2".visible
		elapsed = 0
	if Input.is_action_just_pressed("movement") or Input.is_action_just_pressed("movement2"):
		if curr_dust < num_dust:
			dust_sprites[curr_dust].visible = false
			curr_dust += 1
	if curr_dust >= num_dust:
		won = true
