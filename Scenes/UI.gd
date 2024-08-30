extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%Moneycounter.text = "$ " + str(Global.money)

func _on_button_pressed() -> void: # Abrir estabelecimento
	%NavigationRegion2D.bake_navigation_polygon()
	await %NavigationRegion2D.bake_finished
	%Spawner.process_mode = Node.PROCESS_MODE_INHERIT

func _on_button_2_pressed() -> void: # Acessar a loja
	get_tree().paused = true
	await get_tree().create_timer(0.2).timeout
	var store = load("res://Scenes/UI/Store.tscn").instantiate()
	add_child(store)

func _on_button_3_pressed() -> void: # Acessar o inventário
	var inventory = load("res://Scenes/UI/Inventory.tscn").instantiate()
	get_tree().paused = true
	add_child(inventory)
