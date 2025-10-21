extends Interactable 
class_name Door

signal entered

func act() -> void:
	print("acted")

func enter() -> void:
	print("Entered")
	entered.emit()