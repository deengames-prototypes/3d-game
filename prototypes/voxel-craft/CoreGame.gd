extends Spatial

func _ready():
	$Camera.target_object($MeshInstance)