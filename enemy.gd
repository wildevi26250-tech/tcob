extends CharacterBody3D
@onready var timer = $Timer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var on_floor = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	if is_on_floor():
		on_floor = 1


func _on_timer_timeout() -> void:
	
		linear_velocity.x += randi_range(1, 50)
		linear_velocity.z += randi_range(1, 50)
		linear_velocity.y += randi_range(50, 100)
	
