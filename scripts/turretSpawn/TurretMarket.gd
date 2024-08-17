class_name TurretMarket
extends Node

var _turretMarketAsset: TurretMarketAsset

var chosenTurret: TurretAsset:
	get: return _turretMarketAsset.turretAssets[0]


func _init(turret_market_asset: TurretMarketAsset) -> void:
	_turretMarketAsset = turret_market_asset
