extends ColorRect

signal color_selected

func _ready():
	$Area2D.visible = true

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		self.emit_signal("color_selected", self.color)
