extends RigidBody3D

@onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer.start()


func _on_timer_timeout() -> void:
	linear_velocity.x += randi_range(1, 200)
	linear_velocity.z += randi_range(1, 200)
	angular_velocity.y += randi_range(50, 100)
	
