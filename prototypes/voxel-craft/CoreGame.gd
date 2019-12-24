extends Spatial

const PickableColor = preload("res://PickableColor.gd")

#var _block_color:Color

func _ready():
	# Update camera to look at the main/starter block
	$MeshInstance/Spatial.set_target($MeshInstance)
	
	# Initialize material values
	var i = 0
	var material_worth = [1, 4, 10, 30]
	
	for child in $CanvasLayer.get_children():
		if child is PickableColor:
			i += 1
			var color = child.color
			# First colour: set as first block + selected
			if i == 1:
				continue # erase button
			elif i == 2:
				$MeshInstance.change_color(color)
				Globals.color = color
			
			Globals.material_values[color] = material_worth[i - 2]
	
# Events would solve this better
func _process(delta):
	var materials = Globals.materials_total
	var labour = Globals.labour_total
	var value = materials + labour
	$CanvasLayer/Label.text = "Value: " + str(value) + " (materials: " + str(materials) + ", labour: " + str(labour) + ")"