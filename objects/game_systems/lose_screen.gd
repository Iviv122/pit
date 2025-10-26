extends CanvasLayer
class_name LoseScreen

func _ready() -> void:
	hide()
	Engine.time_scale = 1
	PlayerStatsInstance.died.connect(appear)

func appear() -> void:
	Engine.time_scale = 0
	show()
