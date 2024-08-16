extends Node
class_name GameStarter

@export var assetRoot: AssetRoot


func _ready() -> void:
	GameManager.setAssetRoot(assetRoot)


func _process(_delta: float) -> void:
	if Input.is_action_just_released("space"):
		GameManager.startLevel(assetRoot.Levels[0])
