extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Moneycounter.text = "$ " + str(Global.money)
	
func _on_button_pressed() -> void:
	get_tree().paused = false
	self.queue_free()
