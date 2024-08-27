class_name BulletProjectile
extends InterfaceProjectile

var _speed: float        = 100
var _didHit: bool        = false
var _damage: int         = 5
var _hitEnemy: EnemyData = null


func _on_area_entered(other: Area3D)  -> void:
	_didHit = true
	if other.is_in_group(&"enemy"):
		_hitEnemy = other.enemyData


func tickApprouching(_delta) -> void:
	position += (-rotation * (_speed * _delta))
	if position.x > 10 or position.y > 10 or position.z > 10:
		destroyProjectile()


func didHit() -> bool:
	return _didHit


func destroyProjectile() -> void:
	if _hitEnemy != null:
		_hitEnemy.getDamage(_damage)
	var parrent = get_parent()
	if parrent != null:
		parrent.remove_child(self)
