class_name TurretData

var _turretAsset: TurretAsset
var _turretView: TurretView
var _cell: Cell
var _weapon: InterfaceTurretWeapon
var Weapon: InterfaceTurretWeapon:
    get: return _weapon


func _init(_turret_asset: TurretAsset, cell: Cell) -> void:
    _turretAsset = _turret_asset
    _cell = cell


func attachView(turret_view: TurretView) -> void:
    _turretView = turret_view
    _turretView.attachData(self)

    _weapon = _turretAsset.weaponAsset.getWeapon(_turretView)