extends Area2D

@export var type : String
@export var price : float
@export var difficulty : String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_exited():
	get_parent().canClick = true


func _on_mouse_entered():
	get_parent().canClick = false
