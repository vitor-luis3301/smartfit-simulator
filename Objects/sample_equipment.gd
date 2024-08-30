extends Area2D

@export var type : String
@export var difficulty : String
@export var availible : bool = true
@export var help_needed = false
@export var excercise : String

func _ready() -> void:
	type = Global.selectedItem
	if type == "esteira" or type == "tapete":
		var difficulties = ["easy", "medium", "hard"]
		
		difficulty = difficulties[randi_range(0, 2)]
	else:
		for i in Global.inventory:
			if Global.inventory[i][0] == type:
				difficulty = Global.inventory[i][1]
	
	Global.environment.append([type, difficulty, availible, self])
