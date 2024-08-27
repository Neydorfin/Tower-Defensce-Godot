class_name EnemyData

var _enemy_asset: EnemyAsset
var enemyView: EnemyView
var _health: int


func _init(enemy_asset: EnemyAsset) -> void:
    _enemy_asset = enemy_asset
    _health = enemy_asset.startHealth


func attachView(enemy_view: EnemyView) -> void:
    enemyView = enemy_view
    enemyView.attachData(self)


func getDamage(damage: int) -> void:
    _health -= damage
    if _health < 0:
        die()


func  die():
    print("Die")