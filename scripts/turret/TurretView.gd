class_name TurretView
extends Node3D

@export var _tower: Node3D
@export var projectileOrigin: Node3D
var turretData: TurretData


func attachData(turret_data: TurretData) -> void:
	turretData = turret_data
	position = turretData._cell.Position


func towerLookAt(point: Vector3) -> void:
	point.y = _tower.position.y
	_tower.look_at(point)
