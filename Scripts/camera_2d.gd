extends Camera2D


var shake_intensity : float = 0.0
var shake_duration : float = 0.0
var shake_decay : float = 5.0  


var original_position : Vector2

func _ready():
	original_position = position

func _process(delta: float):
	if shake_duration > 0:
		shake_duration -= delta
		var random_offset = Vector2(randf_range(-shake_intensity, shake_intensity), randf_range(-shake_intensity, shake_intensity))
		position = original_position + random_offset
		shake_intensity = lerp(shake_intensity, 0.0, shake_decay * delta)  
	else:
		position = original_position  


func shake(intensity: float, duration: float):
	shake_intensity = intensity
	shake_duration = duration
