extends RigidBody3D

@onready var timer = $"../Timer"
@onready var ball_anim = $"../AnimationPlayer"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	#await get_tree().create_timer(2).timeout

func _physics_process(delta: float) -> void:
	linear_velocity.y -= 0.0918

func _on_timer_timeout() -> void:
	linear_velocity.x += randf_range(-50, 50)
	linear_velocity.z += randf_range(-50, 50)
	linear_velocity.y += randf_range(1, 50)
	ball_anim.play("Bounce")

	
