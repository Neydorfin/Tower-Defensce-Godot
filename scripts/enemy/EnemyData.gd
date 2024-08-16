class_name EnemyData

var _enemy_asset: EnemyAsset
var enemyView: EnemyView


func _init(enemy_asset: EnemyAsset) -> void:
	_enemy_asset = enemy_asset


func attachView(enemy_view: EnemyView) -> void:
	enemyView = enemy_view
	enemyView.attachData(self)
