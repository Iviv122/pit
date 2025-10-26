extends VBoxContainer
class_name PrefabPalette

@export var list : Array[PackedScene]
@export var map_edit : MapEditor

func _ready():
	for i in list:
		var b := PrefabSelect.new()
		b.item = i
		b.map_edit = map_edit
		b.text = i.resource_name if i.resource_name != "" else i.resource_path.get_file().get_basename()
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		add_child(b)