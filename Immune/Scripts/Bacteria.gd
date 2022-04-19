extends RigidBody


# Magnitude of force used to move forward
var max_move_force = 0.5
var min_move_force = 0.25

var move_force = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	move_force = rand_range(min_move_force, max_move_force)
	
	# Randomize the orientation of the bacteria.
	var rot_x = rand_range(0, 360)
	var rot_y = rand_range(0, 360)
	var rot_z = rand_range(0, 360)
	rotation_degrees = Vector3(rot_x, rot_y, rot_z)


func _physics_process(delta):
	# Get global vectors for the direction the bacterium is facing.
	var dir_x = global_transform.basis.x
	var dir_y = global_transform.basis.y
	var dir_z = global_transform.basis.z
	
	add_central_force(-dir_z * move_force)
