extends Area2D

func _on_mouse_entered():
	get_parent().canClick = false

func _on_mouse_exited():
	get_parent().canClick = true

func changeSizes(mode : String):
	if mode == "middle":
		$bottom_protec.disabled = false
		
		$button_protec.shape.size = Vector2(288, 112); $button_protec.position = Vector2(110, 36)
		$reception_protec.shape.size = Vector2(145,256); $reception_protec.position = Vector2(-729.5, -36); 
		$bottom_protec.shape.size = Vector2(623,16); $bottom_protec.position = Vector2(-345.5, 84)
		# Implement $money_protec when implemented
	elif mode == "big":
		$bottom_protec.disabled = false
		
		$button_protec.shape.size = Vector2(288, 160); $button_protec.position = Vector2(110, 12)
		$reception_protec.shape.size = Vector2(192, 256); $reception_protec.position = Vector2(-706, -36); 
		$bottom_protec.shape.size = Vector2(623, 64); $bottom_protec.position = Vector2(-345.5, 60)
		# Implement $money_protec when implemented
	elif mode == "default":
		$button_protec.shape.size = Vector2(256,96); $button_protec.position = Vector2(126, 44)
		$reception_protec.shape.size = Vector2(128,224); $reception_protec.position = Vector2(-738, -20)
		$bottom_protec.disabled = true
		# Implement $money_protec when implemented
