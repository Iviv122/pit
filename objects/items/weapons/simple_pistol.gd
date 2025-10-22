extends Weapon
class_name SimplePistol

@export var projectile : PackedScene

func shoot(player : CharacterMovement) -> void:

    var m_pos : Vector2 = player.get_global_mouse_position()
    var dir : Vector2 = m_pos - player.global_position

    var bullet : Bullet= projectile.instantiate()

    bullet.global_position = player.global_position + dir.normalized()
    bullet.dir = dir.normalized()
    bullet.speed = 675 

    player.get_tree().current_scene.add_child(bullet)