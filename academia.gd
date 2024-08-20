extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mousePos = get_global_mouse_position()
	$Sprite2D.position = lerp($Sprite2D.position, mousePos, 0.35)
