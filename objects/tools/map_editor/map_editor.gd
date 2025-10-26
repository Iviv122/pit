extends Node2D
class_name MapEditor

@export var scene_layer: TileMapLayer

@export var level: Node2D

func _ready() -> void:
	pass

var wall: Vector2 = Vector2(0, 0)

var id = 1

func save() -> void:
	var scene = PackedScene.new()
	scene.pack(level)
	ResourceSaver.save(scene, 'res://scenes/' + str(DirAccess.open('res://scenes').get_files().size()) + ".tscn")
	get_tree().quit()

var start: Vector2
var finish: Vector2


func start_dragging() -> void:
	print("start")
	start = get_global_mouse_position()

func stop_dragging() -> void:
	print("stop")
	finish = get_global_mouse_position()

	var start_x = int(min(start.x, finish.x))
	var end_x = int(max(start.x, finish.x))
	var start_y = int(min(start.y, finish.y))
	var end_y = int(max(start.y, finish.y))

	for x in range(start_x, end_x):
		for y in range(start_y, end_y):
			SetTile(Vector2(x, y), 0, id)

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		start_dragging()
	elif Input.is_action_just_released("shoot"):
		stop_dragging()
	if (Input.is_action_pressed('cancel')):
		SetTileAtMouse(0, 0, Vector2(-1, -1))
	if (Input.is_action_just_pressed('down')):
		id -= 1
		print(id)
	if (Input.is_action_just_pressed('up')):
		id += 1
		print(id)

	if Input.is_action_just_pressed("esc"):
		save()

func SetTile(pos: Vector2, Layer: int = 0, ID: int = 0, Type: Vector2 = Vector2(0, 0)):
	scene_layer.set_cell(scene_layer.local_to_map(pos), ID, Type)

func SetTileAtMouse(Layer: int = 0, ID: int = 0, Type: Vector2 = Vector2(0, 0)):
	scene_layer.set_cell(scene_layer.local_to_map(get_global_mouse_position()), ID, Type)
