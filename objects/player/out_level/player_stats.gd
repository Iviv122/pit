extends Node
class_name PlayerStats

signal updated()

var hunger : float  = 100
var health : int  = 3

func _process(delta):
    updated.emit()
    hunger -= delta