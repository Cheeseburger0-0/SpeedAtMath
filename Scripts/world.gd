extends Node2D


var max_num = 10
var min_num = 1
var num1 = int(randf_range(min_num, max_num))
var num2 = int(randf_range(min_num, max_num))

var answer = num1 + num2
@onready var label: Label = $Label
@onready var streak_label: Label = $Streak

var answer_time = 10
var max_answer_time = 10
var high_streak = 0
@onready var line_edit: LineEdit = $LineEdit
@onready var high: Label = $High
@onready var time: Label = $Time

var streak = 0 
func _ready() -> void:
	print(answer)
	load_high_score()

func _exit_tree() -> void:
	high_Score_save()

func _process(delta: float) -> void:
	
	if Global.add:
		answer = num1 + num2
		label.text = str((str(num1) + "+" + str(num2) + "="))
	if Global.subtract:
		answer = num1 - num2
		label.text = str((str(num1) + "-" + str(num2) + "="))
	if Global.divide:
		answer = num1 / num2
		label.text = str((str(num1) + "/" + str(num2) + "="))
	if Global.mutilply:
		answer = num1 * num2
		label.text = str((str(num1) + "*" + str(num2) + "="))
		max_num = 5
		
	
	
	time.text = "Time Left: " + str(int(answer_time))
	
	
	
	
	
	
	
	streak_label.text = (str(streak))
	high.text = "High Score: " + str(high_streak)
	
	
	if streak > 0:
		answer_time -= delta
		

	
	
	if streak > high_streak:
		high_streak = streak
		high_Score_save()
	
	if answer_time <= 0:
		streak = 0
		if Global.mutilply:
			max_num = 5
		else:
			max_num = 10
		max_answer_time = 10
	
	
	if line_edit.text == str(answer):
		streak += 1

		
		if streak % 5 == 0:
			max_num += 5
		
		if streak % 20 == 0:
			max_answer_time -= 2
		
		$Sprite2D/AnimationPlayer.play("Bounce")
		num1 = int(randf_range(min_num,max_num))
		num2 = int(randf_range(min_num,max_num))
		line_edit.text = ""
		answer = num1 + num2
		answer_time = max_answer_time
		
	

func high_Score_save():
	
	
	var file = FileAccess.open("user://highscore.save", FileAccess.WRITE)
	file.store_var(high_streak)
	file.close()
	
	
func load_high_score():
	if FileAccess.file_exists("user://highscore.save"):
		var file = FileAccess.open("user://highscore.save", FileAccess.READ)
		high_streak = file.get_var()
		file.close()
		
	
	
	
	
	
	
	
	
	
	


func _on_line_edit_text_changed(new_text: String) -> void:
	$Camera2D.shake(2.0, 0.3)
