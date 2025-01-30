extends Control


@onready var drawing_viewport := $SubViewport
@onready var line := $Line2D

var is_drawing := false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		is_drawing = event.pressed
		
	
	if event is InputEventMouseMotion and is_drawing:
		line.add_point(get_global_mouse_position())
		


func _ready() -> void:
	line.width = 5
	line.default_color = Color(1,1,1)
