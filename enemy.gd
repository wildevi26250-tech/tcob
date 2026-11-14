extends CharacterBody3D
@onready var timer = $RigidBody3D/Timer
@onready var ball_scene = preload("res://Enemy.tscn")

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(randf_range(1, 3)).timeout
	spawn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if is_on_floor():
		Global.on_floor = 1
		print("AAA")
	else:
		Global.on_floor = 0
	move_and_slide()

func _on_timer_timeout() -> void:
	Global.jump = 1
	
	


func _on_area_3d_area_entered(area: Area3D) -> void:
	Global.bounce = 1


func _on_area_3d_area_exited(area: Area3D) -> void:
	Global.bounce = 0
	
func spawn():
	var ball_instance = ball_scene.instantiate()
	add_child(ball_instance)
	
