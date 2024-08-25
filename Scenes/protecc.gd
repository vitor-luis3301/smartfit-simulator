extends Area2D

func _on_mouse_entered():
	get_parent().canClick = false

func _on_mouse_exited():
	get_parent().canClick = true
