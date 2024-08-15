class_name Grid

var Width: int 
var Height: int
var Cells: Array
var PathFinding: FlowFieldPathFinding

func _init(width: int, height: int, offset: Vector3, nodeSize: float, target: Vector2i):
	Width = width
	Height = height
	
	for i in range(Width):
		Cells.append([])
		for j in range(Height):
			Cells[i].append(Cell.new(offset + Vector3(i + 0.5, 0, j + 0.5) * nodeSize))
	
	PathFinding = FlowFieldPathFinding.new(self, target)
	
	PathFinding.UpdateField()
	

func get_cell(i: int, j: int) -> Cell:
	if  (i < 0 or i > Width):
		return null
	if  (j < 0 or j > Height):
		return null
	return Cells[i][j]

func get_cell_from_coord(coordinate: Vector2i) -> Cell:
	return get_cell(coordinate.x, coordinate.y)

func EnumerateCells() -> Array[Variant]:
	var cells : Array[Variant]= []
	for i in range(Width):
		for j in range(Height):
			cells.append(get_cell(i, j))
	return cells


func UpdatePathFinding():
	PathFinding.UpdateField()
	
