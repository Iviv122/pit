extends StaticBody2D
class_name CrossShooter

@export var projectile : PackedScene

var dirs : Array[Vector2] = [ 
    Vector2.DOWN,
    Vector2.UP,
    Vector2.RIGHT,
    Vector2.LEFT,
]

func shoot() -> void:
    for i in dirs:
        var bul : EnemyProjectile = projectile.instantiate()
        bul.global_position = global_position + i*36 
        bul.dir = i
        bul.speed  = 225

        get_parent().add_child(bul)

func shooting() -> void:
    await get_tree().create_timer(1.5).timeout
    shoot()
    shooting()

func _ready():
    shooting()