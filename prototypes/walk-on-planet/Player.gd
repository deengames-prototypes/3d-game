extends KinematicBody

# Simple, linear grvity
const GRAVITY = -9
const MOVE_SPEED = 10

var _velocity = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	_velocity = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_up"):
		_velocity.z = -MOVE_SPEED
	elif Input.is_action_pressed("ui_down"):
		_velocity.z = MOVE_SPEED
	else:
		_velocity.z = 0
	
	if Input.is_action_pressed("ui_left"):
		_velocity.x = -MOVE_SPEED
	elif Input.is_action_pressed("ui_right"):
		_velocity.x = MOVE_SPEED
	else:
		_velocity.x = 0

func _physics_process(delta):
	var gravity_to_center = self.translation.normalized() * GRAVITY
	self.move_and_slide(_velocity + gravity_to_center)
