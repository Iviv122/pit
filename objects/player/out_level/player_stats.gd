extends Node
class_name PlayerStats

signal updated()
signal died()

var hunger : float  = 100
var health : int  = 3

func _process(delta):
    updated.emit()
    hunger -= delta

func feed(a : float) -> void:
    hunger += a
    if hunger >= 100:
        hunger = 100

func deal_damage(amount : int) -> void:
    updated.emit()
    health -= amount
    if health <=0:
        die()

func die() -> void:
    died.emit()