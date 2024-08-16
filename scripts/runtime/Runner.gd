extends Node
class_name Runner

var controllers: Array[InterfaceController]
var isRunning: bool = false


func _process(_delta: float) -> void:
	if not isRunning:
		return
	tickControllers()


func startRunning():
	createAllControllers()
	onStartControllers()
	isRunning = true


func stopRunning():
	onStopControllers()
	isRunning = false


func createAllControllers():
	controllers = []
	controllers.append(TestController.new())


func onStartControllers():
	for controller in controllers:
		if controller:
			controller.onStart()
		else:
			print("Error: %s" % controller.get_name())


func tickControllers():
	for controller in controllers:
		if controller:
			controller.tick()
		else:
			print("Error: %s" % controller.get_name())


func onStopControllers():
	for controller in controllers:
		if controller:
			controller.onStop()
		else:
			print("Error: %s" % controller.get_name())
