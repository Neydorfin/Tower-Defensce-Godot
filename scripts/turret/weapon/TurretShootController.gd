class_name TurretShootController
extends InterfaceController

func onStart() -> void:
	pass

func onStop() -> void:
	pass

func tick(_delta) -> void:
	for turretData: TurretData in GameManager.player.turretDatas:
		turretData.Weapon.tickShoot(_delta)
