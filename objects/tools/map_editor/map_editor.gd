extends Node2D
class_name MapEditor

@export var scene_layer : TileMapLayer 

@export var level : Node2D 

func _ready() -> void:
	pass

var wall : Vector2 = Vector2(0,0)

var id = 1

func save() -> void:
	var scene = PackedScene.new()
	scene.pack(level)
	ResourceSaver.save(scene,'res://scenes/' + str(DirAccess.open('res://scenes').get_files().size()) + ".tscn")

func _input(event):
	if(Input.is_action_pressed('shoot')):
		SetTileAtMouse(0,id,wall)
	if(Input.is_action_pressed('cancel')):
		SetTileAtMouse(0,0,Vector2(-1,-1))
	if(Input.is_action_just_pressed('down')):
		id -=1
		print(id)
	if(Input.is_action_just_pressed('up')):
		id +=1
		print(id)

	if Input.is_action_just_pressed("esc"):
		save()


func SetTileAtMouse(Layer : int = 0, ID : int = 0, Type : Vector2 =  Vector2(0,0)):
	scene_layer.set_cell(scene_layer.local_to_map(get_global_mouse_position()),ID,Type)
