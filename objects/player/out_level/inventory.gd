extends Node
class_name Inventory 

@export var items : Array[Item] 
@export var weapon : Weapon 

func _ready():
    pass


func take_weapon(weap : Weapon) -> void:
    if weapon == null:
        weapon = weap
    else:
        # drop current take new one
        pass

