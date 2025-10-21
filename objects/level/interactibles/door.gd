extends Interactable 
class_name Door

signal entered

func act() -> void:
	enter()

func enter() -> void:
	print("Entered")
	entered.emit()