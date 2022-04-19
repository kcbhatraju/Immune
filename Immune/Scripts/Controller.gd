extends RigidBody


var turn_force = 5   # Magnitude of force used to turn
var move_force = 24  # Magnitude of force used to move forward
var max_speed = 20  # Maximum speed allowed (past this no force will be applied to accelerate)

var half_length = 1  # Half the length of the macrophage (used to find the tip to apply torque)

var move = true
var global_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	# Get global vectors for the direction the macrophage is facing.
	var dir_x = global_transform.basis.x
	var dir_y = global_transform.basis.y
	var dir_z = global_transform.basis.z
	
	# Apply forces to the tip of the macrophage to turn based on user input.
	if global_move:
		if Input.is_action_just_pressed("toggle_movement"): move = !move
		if Input.is_action_pressed("move_up"):
			add_force(-dir_z * half_length, -dir_y * turn_force)
		if Input.is_action_pressed("move_down"):
			add_force(-dir_z * half_length, dir_y * turn_force)
		if Input.is_action_pressed("move_right"):
			add_force(-dir_z * half_length, -dir_x * turn_force)
		if Input.is_action_pressed("move_left"):
			add_force(-dir_z * half_length, dir_x * turn_force)
		
		# Move the macrophage forwards only if it is moving slow enough
		if move && get_linear_velocity().length() < max_speed:
			add_central_force(-dir_z * move_force)


func _on_LevelTimer_timeout():
	global_move = false # Replace with function body.


func _on_Score_level_up():
	max_speed += 50
