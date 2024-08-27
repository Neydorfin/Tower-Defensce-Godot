class_name EnemyView
extends Node3D

var enemyData: EnemyData
var movementAgent: InterfaceMovementAgent


func attachData(enemy_data: EnemyData) -> void:
    enemyData = enemy_data


func createMovementAgent(grid: Grid) -> void:
    movementAgent = GridMovementAgent.new(5, self, grid)
