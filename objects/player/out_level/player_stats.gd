extends Node
class_name PlayerStats

signal updated()
signal died()

var hunger : float  = 100
var health : int  = 3

func _process(delta):
    updated.emit()
    feed(-delta)

func feed(a : float) -> void:
    hunger += a
    if hunger >= 100:
        hunger = 100
    if hunger <= 0:
        die()

func deal_damage(amount : int) -> void:
    health -= amount
    if health >= 3:
        health = 3
    if health <=0:
        die()
    updated.emit()

func die() -> void:
    print("Died")
    died.emit()