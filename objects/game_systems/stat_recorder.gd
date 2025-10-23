extends Node
class_name StatRecorder


var depth : float

signal changed()

func set_depth(amount : float):
	depth = amount
	changed.emit()
func substract_depth(amount : float):
	depth += amount
	changed.emit()
func add_depth(amount : float):
	depth += amount
	changed.emit()