extends Area2D

@export var type : String
@export var price : float
@export var difficulty : String

"""
func _ready():
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_entered", _on_mouse_exited)

func _on_mouse_exited():
	get_parent().canClick = true

func _on_mouse_entered():
	get_parent().canClick = false
"""
