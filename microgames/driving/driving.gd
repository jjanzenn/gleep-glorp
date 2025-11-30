extends Microgame

var rng = RandomNumberGenerator.new()

const lane_0_y = 55.0
const lane_1_y = 135.0

var lane
var position = 17

var done = false

var first_truck_lane
var second_truck_lane

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"truck-1".contact_monitor = true
	$"truck-1".max_contacts_reported = 10
	$"truck-2".contact_monitor = true
	$"truck-2".max_contacts_reported = 10
	$you.contact_monitor = true
	$you.max_contacts_reported = 10
	first_truck_lane = rng.randi_range(0, 1)
	if first_truck_lane == 0:
		$"truck-1".position.y = lane_0_y
		$"truck-2".position.y = lane_1_y
		$you.position.y = lane_1_y
		lane = 1
		second_truck_lane = 1
	else:
		$"truck-1".position.y = lane_1_y
		$"truck-2".position.y = lane_0_y
		$you.position.y = lane_0_y
		lane = 0
		second_truck_lane = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("up") and lane != 0:
		lane = 0
	elif Input.is_action_pressed("down") and lane != 1:
		lane = 1
	
	if lane == 0:
		$you.position.y = lane_0_y
	else:
		$you.position.y = lane_1_y
	
	if not done:
		$you.position.x += 1
		
	$you.move_and_collide(Vector2(0, 0))
	
	if not $you.get_colliding_bodies().is_empty():
		won = false
		done = true
	if $you.position.x > 236:
		done = true
		won = true
		pass
