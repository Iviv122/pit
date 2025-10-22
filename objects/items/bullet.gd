extends Area2D
class_name Bullet

var dir : Vector2
var speed : float 

## ??????????
var damage : float 

func _ready():
    body_entered.connect(on_collide)
    area_entered.connect(on_collide)

func on_collide(_a : Node2D):
    if _a is Bullet:
        return
    if _a is CharacterMovement:
        return
    if _a is Interactor:
        return
    if _a is Enemy:
        _a.damage(1)
    queue_free()

func _process(delta):
    if dir:
        global_position += dir*delta*speed