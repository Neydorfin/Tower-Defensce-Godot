class_name TurretProjectileWeaponAsset
extends TurretWeaponAssetBase

var rateOfFire: float
var maxDistance: float
var projectileAsset: ProjectileAssetBase


func getWeapon(turret_view: TurretView) -> InterfaceTurretWeapon:
    return TurretProjectileWeapon.new(self, turret_view)

