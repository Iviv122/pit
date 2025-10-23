extends Interactable 
class_name LyingFood

@export var feed : int
@export var activate_things : Array[Activateable]
@export var sprite : Sprite2D
var sin_pos : float = 0

func act() -> void:
	for i in activate_things:
		i.act()
	PlayerStatsInstance.feed(feed)
	
	queue_free()

func _process(delta):
	sin_pos += delta
	sprite.position.y = sin(sin_pos)*5