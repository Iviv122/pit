extends Enemy
class_name RoundCat

var dir : Vector2 = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
@export var speed : float = randf_range(150,225)


func _physics_process(_delta):
    if is_on_ceiling() or is_on_floor():
        dir.y = -dir.y
    if is_on_wall():
        dir.x = -dir.x

    velocity = dir * speed
    move_and_slide()