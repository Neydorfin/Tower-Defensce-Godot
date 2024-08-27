class_name TurretProjectileWeapon
extends InterfaceTurretWeapon

var _turretProjectileWeaponAsset: TurretProjectileWeaponAsset
var _turretView: TurretView
var closestEnemyData: EnemyData
var _projectiles: Array[InterfaceProjectile]
var _timeBetweenShots: float
var _maxDistance: float
var _lastShotTime: int = 0


func _init(turret_projectile_weapon_asset: TurretProjectileWeaponAsset, turret_view: TurretView) -> void:
	_turretProjectileWeaponAsset = turret_projectile_weapon_asset
	_timeBetweenShots = 1000 / turret_projectile_weapon_asset.rateOfFire
	_maxDistance = turret_projectile_weapon_asset.maxDistance
	_turretView = turret_view


func tickShoot(_delta) -> void:
	_tickWeapon()
	_tickTower()
	_tickProjectiles(_delta)


func _tickWeapon() -> void:
	var passedTime: int = Time.get_ticks_msec() - _lastShotTime
	if passedTime < _timeBetweenShots:
		return

	closestEnemyData = GameManager.player.enemySearch.getClosestEnemy(_turretView.position, _maxDistance)
	if closestEnemyData == null:
		return

	_tickTower()
	shoot(closestEnemyData)
	_lastShotTime = Time.get_ticks_msec()


func _tickProjectiles(_delta) -> void:
	for i in _projectiles.size():
		var projectile: InterfaceProjectile = _projectiles[i]
		projectile.tickApprouching(_delta)
		if projectile.didHit():
			projectile.destroyProjectile()
			_projectiles[i] = null

	while null in _projectiles:
		_projectiles.erase(null)


func _tickTower() -> void:
	if closestEnemyData != null:
		_turretView.towerLookAt(closestEnemyData.enemyView.position)


func shoot(enemy_data: EnemyData) -> void:
	_projectiles.append(_turretProjectileWeaponAsset.projectileAsset.createProjectile(
		_turretView.projectileOrigin.global_position,
		_turretView.projectileOrigin.global_transform.basis.z,
		enemy_data))
