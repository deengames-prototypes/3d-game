extends Spatial

const UP_VECTOR:Vector3 = Vector3(0, 1, 0)
const ANGLE_INCREMENT = 3

var x_angle:int = 0
var y_angle:int = 0
var target:Spatial

func set_target(target:Spatial):
	self.target = target
	self.rotation.z = (y_angle * PI / 180)
	self.rotation.y = (x_angle * PI / 180)
	$Camera.look_at(target.translation - self.translation, UP_VECTOR)
	
func _unhandled_input(event):
	var moved = false
	if Input.is_action_pressed("ui_left"):
		x_angle += ANGLE_INCREMENT
		moved = true
	elif Input.is_action_pressed("ui_right"):
		x_angle -= ANGLE_INCREMENT
		moved = true
		
	if Input.is_action_pressed("ui_up"):
		y_angle -= ANGLE_INCREMENT
		moved = true
	elif Input.is_action_pressed("ui_down"):
		y_angle += ANGLE_INCREMENT
		moved = true
	
	# https://godotengine.org/qa/41212/how-to-rotate-the-camera-around-an-object-3d
	# Mesh => Spatial => Camera, rotate spatial, DONE
	if moved:
		self.rotation.z = (y_angle * PI / 180)
		self.rotation.y = (x_angle * PI / 180)
		$Camera.look_at(target.translation - self.translation, UP_VECTOR)