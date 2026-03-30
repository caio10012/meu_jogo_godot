extends Node2D

const ObstacleScene := preload("res://scenes/obstacle.tscn")
const SPAWN_AHEAD := 900.0
const SPAWN_Y := 1148.0


func _ready() -> void:
	_schedule_spawn()


func _schedule_spawn() -> void:
	await get_tree().create_timer(randf_range(1.5, 3.0)).timeout
	_spawn()
	_schedule_spawn()


func _spawn() -> void:
	var players := get_tree().get_nodes_in_group("player")
	if players.is_empty():
		return
	var obstacle: Area2D = ObstacleScene.instantiate()
	obstacle.position = Vector2(players[0].position.x + SPAWN_AHEAD, SPAWN_Y)
	get_parent().add_child(obstacle)
