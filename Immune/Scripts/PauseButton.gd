extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var root = get_parent()
onready var timer = root.get_node("LevelTime/LevelTimer")
onready var paused = false

onready var grand = get_parent().get_parent()
onready var player = grand.get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_on_Button_pressed") # Replace with function body.

func _on_Button_pressed():
	if !paused:
		text = "Resume"
	else:
		text = "Pause"
	timer.paused = !timer.paused
	paused = !paused
	player.global_move = !player.global_move
	release_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
