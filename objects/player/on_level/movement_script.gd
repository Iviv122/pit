extends CharacterBody2D
class_name CharacterMovement

@export var speed = 14
@export var jump_force = 250

@export var fall_acceleration = 75
@export var height : float = 1

@export var jump_length : float = 0.1

var target_velocity = Vector2.ZERO
var is_grounded : bool = false
var is_jumping : bool = false

signal jumped

func _ready():
	jumped.connect(on_jumped)

func on_jumped():
	is_jumping = true
	await get_tree().create_timer(jump_length).timeout
	is_jumping = false


func _input(event):
	if Input.is_action_pressed("jump") && is_grounded:

		if target_velocity.y >=0:
			target_velocity.y = 0

		target_velocity.y -= jump_force
		jumped.emit()


func grounded() -> void:

	var space_state = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(global_position, global_position+Vector2.DOWN*height)
	var result = space_state.intersect_ray(query)

	is_grounded = result.size() > 0 

func _process(delta):
	grounded()

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	target_velocity.x = direction.x * speed

	if !is_grounded:
		if !is_jumping:
			target_velocity.y += fall_acceleration

	velocity = target_velocity
	move_and_slide()
