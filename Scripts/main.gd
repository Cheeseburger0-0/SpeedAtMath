extends Control










func _on_add_pressed() -> void:
	Global.add = true
	Global.subtract = false
	Global.divide = false
	Global.mutilply = false
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_sub_pressed() -> void:
	Global.subtract = true
	Global.add = false
	Global.divide = false
	Global.mutilply = false
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_div_pressed() -> void:
	Global.divide = true
	Global.add = false
	Global.subtract = false
	Global.mutilply = false
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_multi_pressed() -> void:
	Global.mutilply = true
	Global.add = false
	Global.subtract = false
	Global.divide = false
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
