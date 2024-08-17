class_name GridRayCastController
extends InterfaceController

var gridHolder: GridHolder


func _init(grid_holder: GridHolder) -> void:
	gridHolder = grid_holder


func onStart() -> void:
	pass


func onStop() -> void:
	pass


func tick(_delta) -> void:
	gridHolder.rayCastInGrid()
