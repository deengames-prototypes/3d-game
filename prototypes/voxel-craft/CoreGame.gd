extends Spatial

const PickableColor = preload("res://PickableColor.gd")

#var _block_color:Color

func _ready():
	# Update camera to look at the main/starter block
	$MeshInstance/Spatial.set_target($MeshInstance)
	var first_color = $CanvasLayer.get_children()[1].color
	$MeshInstance.change_color(first_color)
	Globals.color = first_color