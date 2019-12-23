extends Camera

const UP_VECTOR:Vector3 = Vector3(0, 1, 0)
const CAMERA_DISTANCE = 5

var x_angle:int = 0
var y_angle:int = 0
var target:Spatial

func target_object(obj:Spatial):
	self.target = obj

func _process(delta):
	var moved = false
	if Input.is_action_pressed("ui_left"):
		x_angle += 1
		moved = true
	elif Input.is_action_pressed("ui_right"):
		x_angle -= 1
		moved = true
		
	if Input.is_action_pressed("ui_up"):
		y_angle += 1
		moved = true
	elif Input.is_action_pressed("ui_down"):
		y_angle -= 1
		moved = true
	
	if moved:
		self.translation.z = CAMERA_DISTANCE * cos(x_angle * PI / 180)
		self.translation.y = CAMERA_DISTANCE * sin(y_angle * PI / 180)
		self.look_at(target.translation, UP_VECTOR)
		