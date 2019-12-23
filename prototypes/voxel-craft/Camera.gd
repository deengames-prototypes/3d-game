extends Camera

const UP_VECTOR:Vector3 = Vector3(0, 1, 0)

var camera_distance = 5
var z_angle:int = 0
var y_angle:int = 0
var target:Spatial

func target_object(obj:Spatial):
	self.target = obj

func _unhandled_input(event):
	var moved = false
	if Input.is_action_pressed("ui_left"):
		z_angle += 1
		moved = true
	elif Input.is_action_pressed("ui_right"):
		z_angle -= 1
		moved = true
		
	if Input.is_action_pressed("ui_up"):
		y_angle += 1
		moved = true
	elif Input.is_action_pressed("ui_down"):
		y_angle -= 1
		moved = true
	
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_WHEEL_UP:
		camera_distance -= 1
		moved = true
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_WHEEL_DOWN:
		camera_distance += 1
		moved = true
	
	if moved:
		self.translation.z = camera_distance * cos(z_angle * PI / 180)
		self.translation.y = camera_distance * sin(y_angle * PI / 180)
		self.look_at(target.translation, UP_VECTOR)
		