extends Node3D
@onready var timer = $RigidBody3D/Timer

const SPEED = 20.0
const JUMP_VELOCITY = 4.5
const rotation_speed = 2.1
var velocity2 = Vector3()
var rot = Vector3()




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	if Global.player == null:
		return
	
	var direction = Global.player.global_transform.origin - global_transform.origin
	direction = direction.normalized()
	
	var rotate_amount = direction.cross(global_transform.basis.z)
	rot.y = rotate_amount.y * rotation_speed * delta
	rot.x = rotate_amount.x * rotation_speed * delta
	rotate(Vector3.UP, rot.y)
	rotate(Vector3.RIGHT, rot.x)
	
	global_translate(-global_transform.basis.z * SPEED * delta)
