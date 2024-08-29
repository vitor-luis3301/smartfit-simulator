extends Node2D

@onready var NPC = preload("res://Objects/NPC.tscn")

var objectives = [
	"peso_peq",
	"peso_med",
	"peso_gran",
	"peso_giga"
]

func spawn():
	var newNPC = NPC.instantiate()
	newNPC.position = global_position
	
	newNPC.objective = randi_range(0, objectives.size())
	
	owner.add_child(newNPC)
