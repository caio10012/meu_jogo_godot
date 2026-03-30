extends Area2D

const SPEED := 400.0


func _ready() -> void:
	$VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	position.x -= SPEED * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("Game Over")
