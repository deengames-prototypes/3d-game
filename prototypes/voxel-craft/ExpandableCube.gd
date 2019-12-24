extends MeshInstance

var ExpandableCube = load("res://ExpandableCube.tscn")

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Old block was a " + str(self.get_surface_material(0).albedo_color))
		var cube = ExpandableCube.instance()
		
		click_position = Vector3(round(click_position.x), round(click_position.y), round(click_position.z))
		cube.translation = click_position
		self.get_parent().add_child(cube)
		cube.change_color(Global.color)

func change_color(color):
	var surface_material = self.get_surface_material(0).duplicate()
	self.material_override = surface_material
	surface_material.albedo_color = color