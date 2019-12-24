extends MeshInstance

var ExpandableCube = load("res://ExpandableCube.tscn")

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		var cube = ExpandableCube.instance()
		
		click_position = Vector3(round(click_position.x), round(click_position.y), round(click_position.z))
		cube.translation = click_position
		self.get_parent().add_child(cube)
		
		var current = self.get_surface_material(0)
		self.material_override = current.duplicate()
		current.albedo_color = Global.color
