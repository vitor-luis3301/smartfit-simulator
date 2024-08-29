extends Node2D

@export var GridSizeX = 33
@export var GridSizeY = 20
@export var Dic = {}
@export var canClick : bool = true

@export var spawnedEntity : Node

@export var selectedItem = 0

@onready var equipment = preload("res://Objects/Sample_equipment.tscn")


func _ready() -> void:
	# create floor
	for x in GridSizeX:
		for y in GridSizeY:
			Dic[str(Vector2(x,y))] = {
				"Type" : "Floor"
			}
			%floor.set_cell(Vector2(x, y), 0, Vector2i(0, 0), 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	# change between small tiles and big tiles
	var currentselect = %smol_select
	
	var tile = %smol_select.local_to_map(mouse)
	%beeg_select.clear()
	if Global.selectedItem == "peso_giga":
		currentselect = %mid_select
		tile = %mid_select.local_to_map(mouse)
		%smol_select.clear()
	elif Global.selectedItem == "esteira" || Global.selectedItem == "tapete":
		currentselect = %beeg_select
		tile = %beeg_select.local_to_map(mouse)
		%mid_select.clear()
	
	# add marker for every tile that mouse is on top of
	for x in GridSizeX:
		for y in GridSizeY:
			currentselect.erase_cell(Vector2(x,y))
	
	# delete marker if mouse is not on tile
	if Dic.has(str(tile)):
		%mid_select.clear()
		%smol_select.set_cell(tile, 0, Vector2i(0,0), 0)
		if Global.selectedItem == "peso_giga":
			%smol_select.clear()
			%beeg_select.clear()
			%mid_select.set_cell(tile, 0, Vector2i(0,0), 0)
		elif Global.selectedItem == "esteira" || Global.selectedItem == "tapete":
			%smol_select.clear()
			%mid_select.clear()
			%beeg_select.set_cell(tile, 0, Vector2i(0,0), 0)
	
	var tilesize = 32
	$ProtectedArea.changeSizes("default")
	if Global.selectedItem == "peso_giga":
		tilesize = 48
		$ProtectedArea.changeSizes("middle")
	elif Global.selectedItem == "esteira" || Global.selectedItem == "tapete":
		tilesize = 96
		$ProtectedArea.changeSizes("big")
	
	# define the position of the equipment based on the size of the tile
	var equipPosition = tilesize * tile + Vector2i(tilesize/2, tilesize/2)
	
	var equips = []
	# Add equipment to the map when left mouse button is clicked
	if Input.is_action_just_pressed("left_button") and canClick == true:
		if Global.selectedItem:
			if Global.selectedItem == "peso_giga":
				%mid_equip.set_cell(tile, 0, Vector2i(0,0), 0)
			elif Global.selectedItem == "esteira":
				%beeg_equip.set_cell(tile, 0, Vector2i(0,0), 0)
			elif Global.selectedItem == "tapete":
				%beeg_equip.set_cell(tile, 1, Vector2i(0,0), 0)
			elif Global.selectedItem == "peso_peq":
				%smol_equip.set_cell(tile, 0, Vector2i(0,0), 0)
			elif Global.selectedItem == "peso_med":
				%smol_equip.set_cell(tile, 1, Vector2i(0,0), 0)
			elif Global.selectedItem == "peso_gran":
				%smol_equip.set_cell(tile, 2, Vector2i(0,0), 0)
			
			spawn_equipmens(tilesize, equipPosition)
	
	# Remove equipment to the map if right mouse button is clicked
	if Input.is_action_pressed("right_button"):
		pass 
		# Implement it in another way
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func spawn_equipmens(size, mousePos):
	var newEquip = equipment.instantiate()
	newEquip.position = mousePos
	newEquip.get_node("collision").shape.size = Vector2(size, size)
	
	add_child(newEquip)
	return newEquip
