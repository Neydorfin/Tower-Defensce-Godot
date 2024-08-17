class_name Game
extends Node

static var player: Player
static var assetRoot: AssetRoot
static var currentLevel: LevelAsset
static var runner: Runner
var root: Node


func _ready() -> void:
	root = get_tree().root


func find_child_of_type(parent: Node, type: Object) -> Node:
	for child in parent.get_children():
		if is_instance_of(child, type):
			return child
		var grandchild := find_child_of_type(child, type)
		if grandchild != null:
			return grandchild
	return null


func remove_all_children(node: Node) -> void:
	for child in node.get_children():
		if not is_instance_of(child, Game):
			node.remove_child(child)
			child.queue_free()


func setAssetRoot(_assetRoot: AssetRoot) -> void:
	assetRoot = _assetRoot


func startLevel(_levelAsset: LevelAsset) -> void:
	remove_all_children(get_tree().root)
	currentLevel = _levelAsset
	get_tree().root.add_child(_levelAsset.sceneAsset.instantiate())
	startPlayer()


func startPlayer():
	player = Player.new()
	runner = find_child_of_type(root, Runner)
	runner.startRunning()


func stopPlayer():
	runner.stopRunning()
