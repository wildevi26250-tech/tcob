extends CharacterBody3D
var cooldown = 0
var start_cooldown = 0

@onready var force_play = $AnimationPlayer

func _ready() -> void:
	force_play.play("RESET")

func _process(delta: float) -> void:
	cooldown = cooldown + 1
	if start_cooldown == 1:
		print(cooldown)
	if cooldown > 1100 or start_cooldown == 0:
		if Input.is_action_just_pressed("Shield"):
			force_play.play("Force field")
			cooldown = 0
			start_cooldown = 1
