extends Label

onready var display_timer = $LoseTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _on_Game_Lost():
	show()
	display_timer.start()


func _on_Timer_timeout():
	hide()
	display_timer.stop()
