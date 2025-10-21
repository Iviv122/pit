extends Area2D
class_name AutoTranslator 

func _ready() -> void:
	body_entered.connect(change_scene)

func change_scene(a : Node2D) -> void:
	if a is CharacterMovement:
		LevelLoaderInstance.load_scene()