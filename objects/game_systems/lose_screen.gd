extends CanvasLayer
class_name LoseScreen

func restart() -> void:
	hide()
	Engine.time_scale = 1

func _ready() -> void:
	hide()
	Engine.time_scale = 1
	PlayerStatsInstance.died.connect(appear)

	add_to_group("restart")

func appear() -> void:
	Engine.time_scale = 0
	show()
