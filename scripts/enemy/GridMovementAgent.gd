class_name GridMovementAgent
extends InterfaceMovementAgent

var parrent: Node3D
var Speed: float
var TargetCell: Cell
const TOLERANCE: float = 0.1


func _init(speed: float, _parrent: Node3D, grid: Grid) -> void:
	parrent = _parrent
	Speed = speed

	_setTargetCell(grid.getStartCell())


func _setTargetCell(cell: Cell):
	TargetCell = cell


func tickMovement(_delta) -> void:
	if TargetCell == null:
		return

	var target: Vector3 = TargetCell.Position
	var distance: float = (target - parrent.position).length()

	if distance < TOLERANCE:
		TargetCell = TargetCell.next_Cell
		return

	var direction: Vector3 = (TargetCell.Position - parrent.position).normalized()
	var move: Vector3      = direction * (Speed * _delta)
	
	parrent.position += move
