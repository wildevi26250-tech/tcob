extends Camera3D

@export var target: Node3D
@export var follow_speed: float = 6.0
@export var horizontal_offset: float = 0.0

@export var use_limits: bool = false
@export var min_x: float = -20.0
@export var max_x: float = 50.0

func _physics_process(delta: float) -> void:
	if not target:
		return

	var desired_x: float = target.global_position.x + horizontal_offset
	
	if use_limits:
		desired_x = clamp(desired_x, min_x, max_x)

	global_position.x = lerp(global_position.x, desired_x, follow_speed * delta)
