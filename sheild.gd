extends CharacterBody3D
@onready var sheild_play = $AnimationPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Sheild"):
		sheild_play.play("Sheild")
