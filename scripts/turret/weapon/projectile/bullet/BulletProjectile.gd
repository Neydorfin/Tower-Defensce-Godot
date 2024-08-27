class_name BulletProjectile
extends InterfaceProjectile

var _speed: float
var _damage: float
var _didHit: bool        = false
var _hitEnemy: EnemyData = null


func setAsset(bullet_projectile_asset: BulletProjectileAsset) -> void:
	_speed = bullet_projectile_asset.speed
	_damage = bullet_projectile_asset.damage


func _on_area_entered(other: Area3D)  -> void:
	_didHit = true
	if other.is_in_group(&"enemy") and other is EnemyView:
		_hitEnemy = other.enemyData


func tickApprouching(_delta) -> void:
	position += global_transform.basis.z * (_speed * _delta)
	if position.x > 10 or position.y > 10 or position.z > 10:
		destroyProjectile()


func didHit() -> bool:
	return _didHit


func destroyProjectile() -> void:
	if _hitEnemy != null:
		_hitEnemy.getDamage(_damage)
	var parrent = get_parent()
	if parrent != null:
		self.queue_free()
		parrent.remove_child(self)
