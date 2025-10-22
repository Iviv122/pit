extends Interactable
class_name ActiveButton

@export var activate_things : Array[Activateable]

func act() -> void:
    for i in activate_things:
        i.act()