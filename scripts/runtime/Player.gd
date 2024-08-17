class_name Player
extends Node

var enemyDatas: Array[EnemyData]
var gridHolder: GridHolder
var grid: Grid
var turretMarket: TurretMarket


func _init() -> void:
	gridHolder = GameManager.find_child_of_type(GameManager.root, GridHolder)
	gridHolder.createGrid()
	grid = gridHolder.grid
	turretMarket = TurretMarket.new(GameManager.currentLevel.turretMarketAsset)


func enemySpawned(enemy_data: EnemyData) -> void:
	enemyDatas.append(enemy_data)
