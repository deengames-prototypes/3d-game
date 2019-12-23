extends Camera

const UP_VECTOR:Vector3 = Vector3(0, 1, 0)
const MAX_MOVE = 20
const MIN_MOVE = -MAX_MOVE
var target:Spatial

func target_object(obj:Spatial):
	self.target = obj

func _process(delta):
	var moved = false
	if Input.is_action_pressed("ui_left"):
		self.translation.x = min(self.translation.x + 1, MAX_MOVE)
		moved = true
	elif Input.is_action_pressed("ui_right"):
		self.translation.x = max(self.translation.x - 1, MIN_MOVE)
		moved = true
		
	if Input.is_action_pressed("ui_up"):
		self.translation.y += 1
		moved = true
	elif Input.is_action_pressed("ui_down"):
		self.translation.y -= 1
		moved = true
	
	if moved:
		var vector = target.translation - self.translation
		self.look_at(vector, UP_VECTOR)