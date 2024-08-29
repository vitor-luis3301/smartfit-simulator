extends Control

func _on_button_pressed() -> void:
	get_tree().paused = false
	self.queue_free()

func _physics_process(delta):
	var i = 0
	for slot in $Panel/GridContainer.get_children():
		if i >= Global.inventory.size():
			break
		if slot.get_node("Button").icon == null:
			slot.get_node("Button").icon = load(Global.inventory[i][2])
			slot.get_node("Label").text = str(Global.inventory[i][3])
			slot.selected = Global.inventory[i][0]
		i += 1
				 
