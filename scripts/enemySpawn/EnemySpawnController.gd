class_name EnemySpawnController
extends InterfaceController

var spawnWaves: SpawnWavesAsset
var grid: Grid
var spawnStartTime: int
var passedTimeAtPreviousFrame: int = -1


func _init(_spawnWaves: SpawnWavesAsset, _grid: Grid) -> void:
	spawnWaves = _spawnWaves
	grid = _grid


func onStart() -> void:
	# время в милисекундах
	spawnStartTime = Time.get_ticks_msec()


func onStop() -> void:
	pass


func tick(_delta) -> void:
	# время в милисекундах
	var passedTime: int  = Time.get_ticks_msec() - spawnStartTime
	var timeToSpawn: int = 0

	for wave: SpawnWave in spawnWaves.spawnWaves:
		timeToSpawn += wave.timeBeforeStartWave

		for i in range(wave.count):

			if passedTime >= timeToSpawn and passedTimeAtPreviousFrame < timeToSpawn:
				spawnEnemy(wave.enemyAsset)

			if i < wave.count - 1:
				timeToSpawn += wave.timeBetweenSpawns

	passedTimeAtPreviousFrame = passedTime


func spawnEnemy(enemy_asset: EnemyAsset) -> void:
	var view: EnemyView = enemy_asset.viewPrefab.instantiate()
	view.position = grid.getStartCell().Position
	var root: Node      = GameManager.find_child_of_type(GameManager.root, Runner)
	root.add_child(view)

	var enemyData: EnemyData = EnemyData.new(enemy_asset)
	enemyData.attachView(view)

	view.createMovementAgent(grid)

	GameManager.player.enemySpawned(enemyData)
