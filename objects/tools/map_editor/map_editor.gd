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
	
	level.propagate_call('set_owner',[level])
	scene.pack(level)
	
	var dir = DirAccess.open('res://scenes/num_levels/')
	var num = dir.get_files().size()+1 

	ResourceSaver.save(scene, 'res://scenes/num_levels/' + str(num) + ".tscn")

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

var prefab_to_place : PackedScene 
var prefab_queue : Array[Node2D]
func place() -> void:
	if prefab_to_place:
		var item : Node2D = prefab_to_place.instantiate() 
		item.global_position = scene_layer.local_to_map(get_global_mouse_position())*32
		level.add_child(item)
		prefab_queue.append(item)

func back() -> void:
	if !prefab_queue.is_empty():
		prefab_queue.pop_back().queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		start_dragging()
	elif Input.is_action_just_released("shoot"):
		stop_dragging()
	if Input.is_action_just_pressed("z"):
		back()
	if Input.is_action_just_pressed('jump'):
		place()

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

func SetTile(pos: Vector2, _Layer: int = 0, ID: int = 0, Type: Vector2 = Vector2(0, 0)):
	scene_layer.set_cell(scene_layer.local_to_map(pos), ID, Type)
func SetTileAtMouse(_Layer: int = 0, ID: int = 0, Type: Vector2 = Vector2(0, 0)):
	scene_layer.set_cell(scene_layer.local_to_map(get_global_mouse_position()), ID, Type)
