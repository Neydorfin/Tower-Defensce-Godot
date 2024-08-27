@tool
class_name TurretProjectileWeaponAsset
extends TurretWeaponAssetBase

@export var rateOfFire: float
@export var maxDistance: float
@export var projectileAsset: ProjectileAssetBase


func getWeapon(turret_view: TurretView) -> InterfaceTurretWeapon:
	return TurretProjectileWeapon.new(self, turret_view)
