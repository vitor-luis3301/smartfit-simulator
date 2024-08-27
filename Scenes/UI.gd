extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Moneycounter.text = "$ " + str(Global.money)
	
	if owner.selectedItem+1 > owner.items.size():
		%selectedItem.text = "null"
	else:
		%selectedItem.text = "Item: " + owner.items[owner.selectedItem]

	%selectedItem.text += "\nCan you click? "
	if owner.canClick:
		%selectedItem.text += "Yes, you can!"
	else:
		%selectedItem.text += "No, you can't."

func _on_button_pressed() -> void:
	$NavigationRegion2D.bake_navigation_polygon()
	await $NavigationRegion2D.bake_finished
	$Spawner.spawn(owner.spawnedEntity)

func _on_button_2_pressed() -> void:
	var store = load("res://Scenes/Store.tscn").instantiate()
	get_tree().paused = true
	add_child(store)
