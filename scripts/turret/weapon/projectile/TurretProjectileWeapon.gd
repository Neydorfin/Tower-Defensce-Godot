class_name TurretProjectileWeapon
extends InterfaceTurretWeapon

var _turretProjectileWeaponAsset: TurretProjectileWeaponAsset
var _turretView: TurretView
var _timeBetweenShots: int
var _maxDistance: float
var _lastShotTime: int = 0


func _init(turret_projectile_weapon_asset: TurretProjectileWeaponAsset, turret_view: TurretView) -> void:
    _turretProjectileWeaponAsset = turret_projectile_weapon_asset
    _timeBetweenShots = 1 / turret_projectile_weapon_asset.rateOfFire
    _maxDistance = turret_projectile_weapon_asset.maxDistance
    _turretView = turret_view


func tickShoot() -> void:
    var passedTime: int = Time.get_ticks_msec() - _lastShotTime
    if passedTime < _timeBetweenShots:
        return

    var closestEnemyData: EnemyData = GameManager.player.enemySearch.getClosestEnemy(_turretView.position, _maxDistance)
    if closestEnemyData == null:
        return

    shoot(closestEnemyData)
    _lastShotTime = Time.get_ticks_msec()


func shoot(enemy_data: EnemyData) -> void:
    _turretProjectileWeaponAsset.projectileAsset.createProjectile(
        _turretView.projectileOrigin.position,
        _turretView.projectileOrigin.position.FORWARD,
        enemy_data)
