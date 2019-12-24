extends Spatial

const PickableColor = preload("res://PickableColor.gd")

var _block_color:Color

func _ready():
	$MeshInstance/Spatial.set_target($MeshInstance)
	
	for child in $CanvasLayer.get_children():
		if child is PickableColor:
			child.connect("color_selected", self, "_on_color_selected")

func _on_color_selected(color):
	_block_color = color