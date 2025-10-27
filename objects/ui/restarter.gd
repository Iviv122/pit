extends Button
class_name Restarter

func _pressed() -> void:
    StatRecorderInstance.set_depth(0)
    get_tree().call_group("restart","restart")