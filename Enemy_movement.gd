extends RigidBody3D

@onready var timer_ = $"../Timer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_.wait_time = randf_range(1, 3)
	timer_.start()
	#await get_tree().create_timer(2).timeout

func _physics_process(delta: float) -> void:
	linear_velocity.y -= 0.0918
	
func _process(delta: float) -> void:
	pass
		

func _on_timer_timeout() -> void:
	linear_velocity.x += randf_range(-50, 50)
	linear_velocity.z += randf_range(-50, 50)
	linear_velocity.y += randf_range(-15, 15)

	
