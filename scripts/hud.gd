extends CanvasLayer

var elapsed_time: float = 0.0

@onready var _label: Label = $ScoreLabel


func _process(delta: float) -> void:
	elapsed_time += delta
	_label.text = "Tempo: %.1fs" % elapsed_time
