extends Node
class_name PlayerStats

signal updated()
signal died()

var hunger : float  = 100
var health : int  = 3

func _process(delta):
    updated.emit()
    hunger -= delta

func deal_damage(amount : int) -> void:
    updated.emit()
    health -= amount
    if health <=0:
        die()

func die() -> void:
    died.emit()