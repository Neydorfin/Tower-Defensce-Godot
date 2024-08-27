@tool
class_name BulletProjectileAsset
extends ProjectileAssetBase

@export var _bulletPrefab: PackedScene


func createProjectile(origin: Vector3, originForward: Vector3, enemy_data: EnemyData) -> InterfaceProjectile:
	var runner = GameManager.find_child_of_type(GameManager.root, Runner)
	var bulletPrefab = _bulletPrefab.instantiate()
	bulletPrefab.position = origin
	bulletPrefab.rotation = originForward
	bulletPrefab.set_name("bullet") 
	runner.add_child(bulletPrefab)
	return bulletPrefab
