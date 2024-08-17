class_name TurretSpawnController
extends InterfaceController

var grid: Grid
var turretMarket: TurretMarket


func _init(_grid: Grid, turret_market: TurretMarket) -> void:
	grid = _grid
	turretMarket = turret_market


func onStart() -> void:
	pass


func onStop() -> void:
	pass


func tick(_delta) -> void:
	if grid.hasSelectedCell() and Input.is_action_just_released("left_click"):
		var selectedCell: Cell = grid.selectedCell
		if selectedCell.is_Occupied:
			return

		spawnTurret(turretMarket.chosenTurret, selectedCell)


func spawnTurret(turret_asset: TurretAsset, cell: Cell) -> void:
	var turretView: TurretView = turret_asset.viewPrefab.instantiate()
	var root: Node             = GameManager.find_child_of_type(GameManager.root, Runner)
	root.add_child(turretView)

	var turretData: TurretData = TurretData.new(turret_asset, cell)
	turretData.attachView(turretView)

	cell.is_Occupied = true
	grid.UpdatePathFinding()
	
