extends Node
class_name Game

static var player: Player
static var assetRoot: AssetRoot
static var currentLevel: LevelAsset
static var runner: Runner


func find_child_of_type(class_types: Script) -> Node:
	for child in get_tree().root.get_children():
		if is_instance_of(child, class_types):
			return child
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
	runner = find_child_of_type(Runner)
	runner.startRunning()


func stopPlayer():
	runner.stopRunning()
