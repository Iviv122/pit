extends Enemy
class_name RoundCat

@export var speed: float = randf_range(150, 225)
@export var bounce_check_distance: float = 10.0

var dir: Vector2 = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func on_spawn() -> void:
	dir = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _physics_process(_delta: float) -> void:
	var space_state = get_world_2d().direct_space_state

	var to = global_position + dir * bounce_check_distance

	var result = space_state.intersect_ray(
		PhysicsRayQueryParameters2D.create(global_position, to)
	)

	if result:
		var normal: Vector2 = result.normal
		dir = dir.bounce(normal).normalized()

	global_position += dir * speed 
