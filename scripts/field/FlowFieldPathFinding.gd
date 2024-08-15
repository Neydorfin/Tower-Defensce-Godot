class_name FlowFieldPathFinding

var grid: Grid
var Target: Vector2i


func _init(p_grid: Grid, target: Vector2i):
	grid = p_grid
	Target = target

func UpdateField():
	for cell: Cell in grid.EnumerateCells():
		cell.ResetWeight()
	
	var queue: Array[Vector2i] = []
	
	queue.append(Target)
	grid.get_cell_from_coord(Target).PathWeight = 0
	
	while not queue.is_empty():
		var current = queue.pop_front()
		var currentCell: Cell = grid.get_cell_from_coord(current)
		var weight_to_target: float = currentCell.PathWeight + 1
		
		for neighbour in GetNeighbours(current):
			var neighbourCell: Cell = grid.get_cell_from_coord(neighbour)
			
			if weight_to_target < neighbourCell.PathWeight:
				neighbourCell.next_Cell = currentCell
				neighbourCell.PathWeight = weight_to_target
				queue.append(neighbour)
				
func GetNeighbours(coordinate: Vector2i) -> Array[Variant]:
	var rightCoordinates: Vector2i = coordinate + Vector2i.RIGHT
	var leftCoordinates: Vector2i = coordinate + Vector2i.LEFT
	var upCoordinates: Vector2i = coordinate + Vector2i.UP
	var downCoordinates: Vector2i = coordinate + Vector2i.DOWN

	var hasRightCell : bool = rightCoordinates.x < grid.Width and !grid.get_cell_from_coord(rightCoordinates).is_Occupied
	var hasLeftCell : bool = leftCoordinates.x >= 0 and !grid.get_cell_from_coord(leftCoordinates).is_Occupied
	var hasUpCell : bool = upCoordinates.y >= 0 and !grid.get_cell_from_coord(upCoordinates).is_Occupied
	var hasDowmCell : bool = downCoordinates.y < grid.Height and !grid.get_cell_from_coord(downCoordinates).is_Occupied

	var neighbours_coordinate : Array[Variant] = []
	
	if hasRightCell:
		neighbours_coordinate.append(rightCoordinates)
	if hasLeftCell:
		neighbours_coordinate.append(leftCoordinates)
	if hasUpCell:
		neighbours_coordinate.append(upCoordinates)
	if hasDowmCell:
		neighbours_coordinate.append(downCoordinates)
	
	return neighbours_coordinate
