extends Node2D

const ObstacleScene := preload("res://scenes/obstacle.tscn")
const SPAWN_X := 780.0
const SPAWN_Y := 1148.0  # ground top (1180) - metade do sprite (32)


func _ready() -> void:
	_schedule_spawn()


func _schedule_spawn() -> void:
	await get_tree().create_timer(randf_range(1.5, 3.0)).timeout
	_spawn()
	_schedule_spawn()


func _spawn() -> void:
	var obstacle: Area2D = ObstacleScene.instantiate()
	obstacle.position = Vector2(SPAWN_X, SPAWN_Y)
	get_parent().add_child(obstacle)
