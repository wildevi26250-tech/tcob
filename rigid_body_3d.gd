extends RigidBody3D

@onready var timer = $"../Timer"
@onready var ball_anim = $"../AnimationPlayer"
@onready var area3d = $"../Area3D"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#await get_tree().create_timer(2).timeout

func _physics_process(delta: float) -> void:
	on_collision()



func on_collision() -> void:
	if area3d.body_entered :
		linear_velocity.x += randf_range(-20, 20)
		linear_velocity.z += randf_range(-20, 20)
		linear_velocity.y += randf_range(1, 50)
		ball_anim.play("Bounce")
	
