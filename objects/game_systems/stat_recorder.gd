extends Node
class_name StatRecorder


var depth : float

signal changed()

func _ready():
	add_to_group("restart")

func restart() -> void:
	set_depth(0)
	await get_tree().process_frame
	set_depth(0)

func set_depth(amount : float):
	depth = amount
	changed.emit()
func substract_depth(amount : float):
	depth += amount
	changed.emit()
func add_depth(amount : float):
	depth += amount
	changed.emit()