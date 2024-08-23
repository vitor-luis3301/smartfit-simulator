extends Node2D

@export var GridSizeX = 33
@export var GridSizeY = 20
@export var Dic = {}

var selectedItem = 0

var items = [
	"med_weight",
	"big_weight",
	"threadmill",
	"mat"
]

@onready var equipment = preload("res://Sample_equipment.tscn")

func _ready() -> void:
	# create floor
	for x in GridSizeX:
		for y in GridSizeY:
			Dic[str(Vector2(x,y))] = {
				"Type" : "Floor"
			}
			%floor.set_cell(Vector2(x, y), 0, Vector2i(0, 0), 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	
	# change between small tiles and big tiles
	var tile = %smol_select.local_to_map(mouse)
	%beeg_select.clear()
	if selectedItem >= 2:
		tile = %beeg_select.local_to_map(mouse)
		%smol_select.clear()
	
	# add marker for every tile that mouse is on top of
	for x in GridSizeX:
		for y in GridSizeY:
			%smol_select.erase_cell(Vector2(x,y))
			if selectedItem >= 2:
				%beeg_select.erase_cell(Vector2(x,y))
	
	# delete marker if mouse is not on tile
	if Dic.has(str(tile)):
		%smol_select.set_cell(tile, 1, Vector2i(0,0), 0)
		if selectedItem >= 2:
			%smol_select.clear()
			%beeg_select.set_cell(tile, 0, Vector2i(0,0), 0)
	
	# Select items on mouse wheel up or down or arrow up or down is clicked
	if Input.is_action_just_pressed("select_down"):
		selectedItem += 1
	if Input.is_action_just_pressed("select_up"):
		selectedItem -= 1
	if selectedItem < 0:
		selectedItem = 0
	
	# Add equipment to the map if left mouse button is clicked
	var tilesize : int
	if Input.is_action_pressed("left_button"):
		%smol_equip.set_cell(tile, selectedItem, Vector2i(0,0), 0)
		if selectedItem >= 2:
			%beeg_equip.set_cell(tile, selectedItem-2, Vector2i(0,0), 0)
			tilesize = 96
		tilesize = 32
		# add code to add `Sample_equipment` with `collision`'s size as tilesize
	
	# Remove equipment to the map if right mouse button is clicked
	if Input.is_action_pressed("right_button"):
		%smol_equip.erase_cell(tile)
		if selectedItem >= 2:
			%beeg_equip.erase_cell(tile)
	
	if selectedItem+1 > items.size():
		%selectedItem.text = "null"
	else:
		%selectedItem.text = "Item: " + items[selectedItem]
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
