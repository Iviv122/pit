extends Label
class_name DepthMeter 

func update() -> void:
	text = str(int(StatRecorderInstance.depth)) + "m"

func restart() -> void:
	text = "0" + "m"
	StatRecorderInstance.set_depth(0)

func _ready():
	add_to_group("restart")
	StatRecorderInstance.changed.connect(update)