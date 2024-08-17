extends Node
class_name Runner

var controllers: Array[InterfaceController]
var isRunning: bool = false


func _process(_delta: float) -> void:
	if not isRunning:
		return
	tickControllers(_delta)


func startRunning():
	createAllControllers()
	onStartControllers()
	isRunning = true


func stopRunning():
	onStopControllers()
	isRunning = false


func createAllControllers():
	controllers = [
	GridRayCastController.new(GameManager.player.gridHolder),
	EnemySpawnController.new(GameManager.currentLevel.spawnWavesAsset, GameManager.player.grid),
	TurretSpawnController.new(GameManager.player.grid, GameManager.player.turretMarket),
	MovementController.new(),
	]


func onStartControllers():
	for controller in controllers:
		if controller:
			controller.onStart()
		else:
			print("Error: %s" % controller.get_name())


func tickControllers(_delta):
	for controller in controllers:
		if controller:
			controller.tick(_delta)
		else:
			print("Error: %s" % controller.get_name())


func onStopControllers():
	for controller in controllers:
		if controller:
			controller.onStop()
		else:
			print("Error: %s" % controller.get_name())
