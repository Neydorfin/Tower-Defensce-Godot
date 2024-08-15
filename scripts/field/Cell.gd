extends Node3D
class_name Cell

var Position: Vector3
var next_Cell: Cell
var is_Occupied: bool
var PathWeight: float

func _init(position: Vector3):
	Position = position
	
func ResetWeight():
	PathWeight = INF
