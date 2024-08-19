class_name TurretView
extends Node3D

var turretData: TurretData
var projectileOrigin: Node3D


func attachData(turret_data: TurretData) -> void:
    turretData = turret_data
    position = turretData.cell.Position
