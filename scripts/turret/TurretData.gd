class_name TurretData

var turretView: TurretView
var cell: Cell


func _init(_turret_asset: TurretAsset, _cell: Cell) -> void:
	cell = _cell



func attachView(turret_view: TurretView) -> void:
	turretView = turret_view
	turretView.attachData(self)
