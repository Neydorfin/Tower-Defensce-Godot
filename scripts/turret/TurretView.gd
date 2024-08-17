class_name TurretView
extends Node3D

var turretData: TurretData


func attachData(turret_data: TurretData) -> void:
    turretData = turret_data
    position = turretData.cell.Position