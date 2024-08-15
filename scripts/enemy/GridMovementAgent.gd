extends Node3D
class_name GridMovementAgent

@export var Speed: float
var TargetCell: Cell

const TOLERANCE : float = 0.1

func _process(delta) -> void:
	if TargetCell == null:
		return
		
	var target: Vector3 = TargetCell.Position
	var distance: float = (target - self.position).length()
	
	if distance < TOLERANCE:
		TargetCell = TargetCell.next_Cell
		return
	
	var direction: Vector3 = (TargetCell.Position - self.position).normalized()
	var move: Vector3 = direction * (Speed * delta)
	
	self.position += move

func setStartCell(cell: Cell):
	TargetCell = cell
