extends CharacterBody2D
class_name CharacterMovement


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

var is_grounded : bool = false

var init_pos : Vector2
var init_depth : float = StatRecorderInstance.depth

func _ready():
	init_pos = global_position

func check_is_drop_down():
	pass

func drop():
	position.y +=1

func ground_check():
	var space_state = get_world_2d().direct_space_state

	var rectangle_shape = RectangleShape2D.new()

	rectangle_shape.size.x = 32
	rectangle_shape.size.y = 4 

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = rectangle_shape
	query.transform = transform
	query.transform.origin =global_position+Vector2.DOWN*18 
	query.collide_with_areas = true 

	var result = space_state.intersect_shape(query) 


	is_grounded = result.size() > 0


func _physics_process(delta: float) -> void:
	
	ground_check()
	if Input.is_action_pressed("down"):
		drop()

	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	StatRecorderInstance.set_depth(init_depth - (init_pos-global_position).y/50)

	move_and_slide()
