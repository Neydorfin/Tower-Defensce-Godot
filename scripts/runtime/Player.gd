class_name Player
extends Node

var enemyDatas: Array[EnemyData]
var gridHolder: GridHolder
var grid: Grid


func _init() -> void:
	gridHolder = GameManager.find_child_of_type(GameManager.root, GridHolder)
	gridHolder.createGrid()
	grid = gridHolder.grid


func enemySpawned(enemy_data: EnemyData) -> void:
	enemyDatas.append(enemy_data)
