class_name Grid

var Cells: Array
var Width: int
var Height: int
var startCoordinate: Vector2i
var targetCoordinate: Vector2i
var selectedCell: Cell = null
var PathFinding: FlowFieldPathFinding


func _init(width: int, height: int, offset: Vector3, nodeSize: float, start: Vector2i, target: Vector2i):
	Width = width
	Height = height

	startCoordinate = start
	targetCoordinate = target

	for i in range(Width):
		Cells.append([])
		for j in range(Height):
			Cells[i].append(Cell.new(offset + Vector3(i + 0.5, 0, j + 0.5) * nodeSize))

	PathFinding = FlowFieldPathFinding.new(self, target)

	PathFinding.UpdateField()


func getStartCell() -> Cell:
	return get_cell_from_coord(startCoordinate)


func getTargetCell() -> Cell:
	return get_cell_from_coord(targetCoordinate)


func selectCoordinate(coordinate: Vector2i) -> void:
	selectedCell = get_cell_from_coord(coordinate)


func unselectCell() -> void:
	selectedCell = null


func getSelectedCell() -> Cell:
	return selectedCell


func hasSelectedCell() -> bool:
	return selectedCell != null


func get_cell(i: int, j: int) -> Cell:
	if  (i < 0 or i > Width):
		return null
	if  (j < 0 or j > Height):
		return null
	return Cells[i][j]


func get_cell_from_coord(coordinate: Vector2i) -> Cell:
	return get_cell(coordinate.x, coordinate.y)


func EnumerateCells() -> Array[Variant]:
	var cells: Array[Variant] = []
	for i in range(Width):
		for j in range(Height):
			cells.append(get_cell(i, j))
	return cells


func UpdatePathFinding():
	PathFinding.UpdateField()
	
