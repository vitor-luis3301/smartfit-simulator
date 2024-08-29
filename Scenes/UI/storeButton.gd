extends Button

@export var equipment : String
@export var price : int
@export var dificulty : String

func _ready() -> void:
	connect("pressed", _on_buying_pressed)

func _on_buying_pressed() -> void:
	if Global.money - price >= 0:
		var newItem = [equipment, dificulty, icon.resource_path, 1]
		
		var i = 0
		while i < 10:
			if Global.inventory.has(i):
				if (Global.inventory[i][0] == newItem[0] and
					Global.inventory[i][1] == newItem[1] and
					Global.inventory[i][2] == newItem[2]):
					Global.inventory[i][3] += 1
					i = 0
					break
				else:
					i += 1
			else:
				Global.inventory[i] = newItem
				break
		
		Global.money -= price
		
		print(Global.inventory)
