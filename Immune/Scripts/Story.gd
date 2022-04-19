extends Control

onready var timer = Timer.new()

# timer wait time set to 30 times a second
func _ready():
	timer.wait_time = 24
	timer.connect("timeout", self, "_on_timer_timeout")
	add_child(timer)
	timer.start()

func _physics_process(delta):
	$Label.rect_position.y -= 50*delta

func _on_timer_timeout():
	timer.stop()
	get_tree().change_scene("res://Scenes/Arena.tscn")
