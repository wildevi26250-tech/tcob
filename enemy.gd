extends CharacterBody3D
@onready var timer = $RigidBody3D/Timer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _physics_process(delta: float) -> void:
	if is_on_floor():
		Global.on_floor = 1
	else:
		Global.on_floor = 0


func _on_timer_timeout() -> void:
	Global.jump = 1
	
	
