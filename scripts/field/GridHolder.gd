extends Node3D
class_name GridHolder

@export var GridWidth: int
@export var GridHeight: int
@export var CellSize: float
@export var TargetCoordinate: Vector2i
@export var StartCoordinate: Vector2i

const RAY_LENGTH : float = 1000.0

var grid: Grid
var Camera: Camera3D
var Offset: Vector3


func _ready():
	Camera = get_viewport().get_camera_3d()
	var width : float = GridWidth * CellSize
	var height : float = GridHeight * CellSize
	
	# Plane has double size of 1
	self.scale = Vector3(width * 0.5, 1, height * 0.5)
	
	Offset = self.position - (Vector3(width, 0, height) * 0.5)
	grid = Grid.new(GridWidth, GridHeight, Offset, CellSize, TargetCoordinate)
	
	
	
func _physics_process(_delta) -> void:
	if grid == null or Camera == null:
		return
	
	var space_state: PhysicsDirectSpaceState3D = get_viewport().world_3d.direct_space_state
	var mousePostion: Vector2 = get_viewport().get_mouse_position()
	var origin : Vector3 = Camera.project_ray_origin(mousePostion)
	var end : Vector3 = origin + Camera.project_ray_normal(mousePostion) * RAY_LENGTH
	var query: PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true
	var result : Dictionary = space_state.intersect_ray(query)
	
	if not result.is_empty():
		var hit_position = result.position
		var difference = hit_position - Offset
		
		var x : int = int(difference.x / CellSize)
		var y : int = int(difference.z / CellSize)
		
		if Input.is_action_just_pressed("left_click"):
			var cell : Cell = grid.get_cell(x, y)
			cell.is_Occupied = !cell.is_Occupied 
			grid.UpdatePathFinding()
