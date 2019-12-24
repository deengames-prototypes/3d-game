extends MeshInstance

var ExpandableCube = load("res://ExpandableCube.tscn")

func _init():
	Globals.num_cubes += 1

func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		
		if Globals.is_erase and Globals.num_cubes > 1:
			Globals.num_cubes -= 1
			self.get_parent().remove_child(self)
			self.queue_free()
		else:
			var cube = ExpandableCube.instance()
			click_position = Vector3(round(click_position.x), round(click_position.y), round(click_position.z))
			cube.translation = click_position
			self.get_parent().add_child(cube)
			cube.change_color(Globals.color)
			Globals.num_cubes += 1

func change_color(color):
	var surface_material = self.get_surface_material(0).duplicate()
	self.material_override = surface_material
	surface_material.albedo_color = color