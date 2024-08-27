extends Button

@export var equipment : String
@export var price : int
@export var dificulty : String

func _ready() -> void:
	connect("pressed", _on_buying_pressed)

func _on_buying_pressed() -> void:
	print(equipment)
