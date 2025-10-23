extends ProgressBar
class_name HungerBar

func redraw() -> void:
    value = PlayerStatsInstance.hunger 

func _ready():
    max_value = PlayerStatsInstance.hunger
    min_value = 0
    value = PlayerStatsInstance.hunger 
    PlayerStatsInstance.updated.connect(redraw)