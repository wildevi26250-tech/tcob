extends CharacterBody3D

@onready var force_play = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Block"):
		force_play.play("Force field")
