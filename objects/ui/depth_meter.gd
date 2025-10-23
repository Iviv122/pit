extends Label
class_name DepthMeter 

func update() -> void:
	text = str(int(StatRecorderInstance.depth)) + "m"

func _ready():
	StatRecorderInstance.changed.connect(update)