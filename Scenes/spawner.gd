extends Node2D

@onready var NPC = preload("res://Objects/NPC.tscn")

func spawn():
	var newNPC = NPC.instantiate()
	newNPC.position = global_position
	
	owner.add_child(newNPC)

func _ready() -> void: 
	$Timer.connect("timeout", _on_timeout)

func _on_timeout() -> void: 
	spawn()

func _physics_process(delta): pass
	#spawn()
