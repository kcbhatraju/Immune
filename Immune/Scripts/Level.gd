extends Label


var level = 1

onready var display_timer = $ShowTimer
onready var lose_timer = $LoseTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	show_level()


func show_level():
	show()
	display_timer.start()


func _on_Score_level_up():
	level += 1
	text = str("Level ", level)
	
	show_level()


func _on_Timer_timeout():
	# Hide the level up display.
	hide()
	display_timer.stop()


func _on_LevelTime_lose():
	text = str("You lose!")
	Engine.iterations_per_second = 0
	Engine.time_scale = 1
	lose_timer.start()


func _on_LoseTimer_timeout():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
