class_name EnemyData

var enemyView: EnemyView
var enemyAsset: EnemyAsset
var _health: float


func _init(enemy_asset: EnemyAsset) -> void:
	enemyAsset = enemy_asset
	_health = enemy_asset.startHealth


func attachView(enemy_view: EnemyView) -> void:
	enemyView = enemy_view
	enemyView.attachData(self)


func getDamage(damage: float) -> void:
	_health -= damage
	if _health < 0:
		die()


func  die():
	print("Die")
