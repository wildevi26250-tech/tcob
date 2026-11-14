extends RigidBody3D

@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	linear_velocity.x += randi_range(1, 50)
	linear_velocity.z += randi_range(1, 50)
	linear_velocity.y += randi_range(50, 100)
	
