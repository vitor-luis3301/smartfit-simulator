extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Moneycounter.text = "$ " + str(Global.money)
	
	if Global.selectedItem == "" || Global.selectedItem == null:
		%selectedItem.text = "null"
	else:
		%selectedItem.text = "Item: " + Global.selectedItem

	%selectedItem.text += "\nCan you click? "
	if owner.canClick:
		%selectedItem.text += "Yes, you can!"
	else:
		%selectedItem.text += "No, you can't."

func _on_button_pressed() -> void:
	%NavigationRegion2D.bake_navigation_polygon()
	await %NavigationRegion2D.bake_finished
	%Spawner.spawn(owner.spawnedEntity)

func _on_button_2_pressed() -> void:
	get_tree().paused = true
	await get_tree().create_timer(0.2).timeout
	var store = load("res://Scenes/Store.tscn").instantiate()
	add_child(store)

func _on_button_3_pressed() -> void:
	var inventory = load("res://Scenes/Inventory.tscn").instantiate()
	get_tree().paused = true
	add_child(inventory)
