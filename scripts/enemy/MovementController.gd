class_name MovementController
extends InterfaceController

func onStart() -> void:
	pass


func onStop() -> void:
	pass


func tick(_delta) -> void:
	for enemy: EnemyData in GameManager.player.enemyDatas:
		enemy.enemyView.movementAgent.tickMovement(_delta)
