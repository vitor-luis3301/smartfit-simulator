extends Node2D

@onready var NPC = preload("res://Objects/NPC.tscn")

func spawn(node):
	var newNPC = NPC.instantiate()
	newNPC.position = global_position
	newNPC.target = node
	
	owner.add_child(newNPC)
