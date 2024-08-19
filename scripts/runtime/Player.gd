class_name Player
extends Node

var enemyDatas: Array[EnemyData]
var gridHolder: GridHolder
var grid: Grid
var turretMarket: TurretMarket
var enemySearch: EnemySearch


func _init() -> void:
    gridHolder = GameManager.find_child_of_type(GameManager.root, GridHolder)
    gridHolder.createGrid()
    grid = gridHolder.grid
    turretMarket = TurretMarket.new(GameManager.currentLevel.turretMarketAsset)
    enemySearch = EnemySearch.new(enemyDatas)


func enemySpawned(enemy_data: EnemyData) -> void:
    enemyDatas.append(enemy_data)
