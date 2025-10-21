extends CharacterBody2D
class_name CharacterMovement


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func check_is_drop_down():
	pass

func drop():
	position.y +=1

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("down"):
		drop()

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
