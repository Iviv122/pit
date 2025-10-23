extends ProgressBar
class_name HealthMeter


func redraw() -> void:
    value = PlayerStatsInstance.health 

func _ready():
    max_value = PlayerStatsInstance.health
    min_value = 0
    value = PlayerStatsInstance.health 
    PlayerStatsInstance.updated.connect(redraw)