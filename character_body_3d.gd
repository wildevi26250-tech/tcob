extends CharacterBody3D
@onready var menu_scene = preload("res://Menu.tscn")

@export var speed: float = 6.5
@export var rotation_speed: float = 12.0

@export var dash_speed: float = 50.0
@export var dash_duration: float = 0.2
@export var dash_cooldown: float = 0.8

@onready var rig: Node3D = $"tcob-player"
@onready var anim_player: AnimationPlayer = $"tcob-player/AnimationPlayer"


var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_dashing: bool = false
var can_dash: bool = true
var dash_dir: Vector3 = Vector3.ZERO

func _ready() -> void:
	Global.player = self


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta

	var direction := get_movement_direction()

	if Input.is_action_just_pressed("dash") and can_dash and not is_dashing:
		start_dash(direction)

	if is_dashing:
		velocity.x = dash_dir.x * dash_speed
		velocity.z = dash_dir.z * dash_speed
		rotate_rig(dash_dir, delta)
	elif direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		rotate_rig(direction, delta)
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)

	move_and_slide()
	update_animations(direction)


func get_movement_direction() -> Vector3:
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var cam := get_viewport().get_camera_3d()
	if not cam:
		return Vector3(input_dir.x, 0.0, input_dir.y).normalized()

	var forward := cam.global_basis.z
	var right := cam.global_basis.x
	forward.y = 0.0
	right.y = 0.0
	return (right.normalized() * input_dir.x + forward.normalized() * input_dir.y).normalized()


func start_dash(direction: Vector3) -> void:
	is_dashing = true
	can_dash = false
	dash_dir = direction if direction else rig.global_basis.z.normalized()

	get_tree().create_timer(dash_duration).timeout.connect(func() -> void:
		is_dashing = false)
	get_tree().create_timer(dash_cooldown).timeout.connect(func() -> void:
		can_dash = true)


func rotate_rig(direction: Vector3, delta: float) -> void:
	var target_angle := atan2(direction.x, direction.z)
	rig.rotation.y = lerp_angle(rig.rotation.y, target_angle, rotation_speed * delta)


func update_animations(direction: Vector3) -> void:
	var anim := "Move01" if direction else "Idle01"
	if anim_player.has_animation(anim) and anim_player.current_animation != anim:
		anim_player.play(anim)





func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("enemy"):
		get_tree().change_scene_to_file("res://lose.tscn")
		
