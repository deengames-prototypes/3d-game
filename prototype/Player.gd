extends KinematicBody

# Simple, linear grvity
var GRAVITY = Vector3(0, -98, 0)
var _velocity = Vector3(0, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	self.move_and_slide(_velocity + GRAVITY)
