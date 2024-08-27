@tool
class_name BulletProjectileAsset
extends ProjectileAssetBase

@export var _bulletPrefab: PackedScene
@export var speed: float
@export var damage: float

func createProjectile(origin: Vector3, originForward: Vector3, enemy_data: EnemyData) -> InterfaceProjectile:
	var runner = GameManager.find_child_of_type(GameManager.root, Runner)
	var bulletPrefab: BulletProjectile = _bulletPrefab.instantiate()
	bulletPrefab.position = origin
	bulletPrefab.basis.z = originForward
	bulletPrefab.setAsset(self)
	runner.add_child(bulletPrefab)
	return bulletPrefab
