extends Button

func _ready():
	connect("pressed", self, "_on_Button_pressed")

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Arena.tscn")
