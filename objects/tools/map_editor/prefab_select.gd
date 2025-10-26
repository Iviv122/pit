extends Button
class_name PrefabSelect

@export var item : PackedScene
@export var map_edit : MapEditor

func _ready():
    print("loaded: ",item.resource_name)
    pass

func _pressed() -> void:
    print(item.resource_name)
    map_edit.prefab_to_place = item