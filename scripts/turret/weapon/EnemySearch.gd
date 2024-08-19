class_name EnemySearch
extends Node

var _enemyDatas: Array[EnemyData]


func _init(enemy_datas: Array[EnemyData]) -> void:
	_enemyDatas = enemy_datas


func getClosestEnemy(center: Vector3, max_distance: float) -> EnemyData:
	var maxSqrDistance: float   = pow(max_distance, 2)
	var minSqrDistance: float   = INF
	var closestEnemy: EnemyData = null

	for enemy in _enemyDatas:
		var sqrDistance: float = (enemy.enemyView.position - center).length_squared()
		if sqrDistance > maxSqrDistance:
			continue

		if sqrDistance < minSqrDistance:
			minSqrDistance = sqrDistance
			closestEnemy = enemy

	return closestEnemy
