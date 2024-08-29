extends Control

@export var selected : String

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.connect("pressed", _on_button_pressed)
	
func _on_button_pressed() -> void:
	if selected != "":
		Global.selectedItem = selected
		get_tree().paused = false
		owner.queue_free()
