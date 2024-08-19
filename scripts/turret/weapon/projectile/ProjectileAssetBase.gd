@tool
class_name ProjectileAssetBase
extends Resource

func createProjectile(origin: Vector3, originForward: Vector3, enemy_data: EnemyData) -> ProjectileBase:
    return