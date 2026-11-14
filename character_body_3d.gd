extends CharacterBody3D

@export var speed: float = 6.5
@export var rotation_speed: float = 12.0
@export var jump_velocity: float = 6.0

@onready var rig: Node3D = $"tcob-player/rig"
@onready var anim_player: AnimationPlayer = $"tcob-player/AnimationPlayer"

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	elif Input.is_action_just_pressed("Jump"):
		velocity.y = jump_velocity

	var input_dir: Vector2 = Input.get_vector("left", "right", "forward", "backward")
	
	var cam := get_viewport().get_camera_3d()
	var direction := Vector3.ZERO
	
	if cam:
		var cam_forward: Vector3 = cam.global_basis.z
		cam_forward.y = 0.0
		cam_forward = cam_forward.normalized()
		
		var cam_right: Vector3 = cam.global_basis.x
		cam_right.y = 0.0
		cam_right = cam_right.normalized()
		
		direction = (cam_right * input_dir.x + cam_forward * input_dir.y).normalized()
	else:
		direction = Vector3(input_dir.x, 0.0, input_dir.y).normalized()

	if direction != Vector3.ZERO:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		var target_angle: float = atan2(direction.x, direction.z) + PI
		rig.rotation.y = lerp_angle(rig.rotation.y, target_angle, rotation_speed * delta)
		
		update_animation("rigAction")

		
		update_animation("rigAction")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
		update_animation("metarig")

	if not is_on_floor():
		update_animation("jump")

	move_and_slide()

func update_animation(anim_name: String) -> void:
	if anim_player.has_animation(anim_name) and anim_player.current_animation != anim_name:
		anim_player.play(anim_name)
