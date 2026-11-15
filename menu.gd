extends Control
@onready var main_scene = preload("res://Main.tscn")

func _on_button_pressed() -> void:
	var main_instance = main_scene.instantiate()
	add_child(main_instance)
	hide()
