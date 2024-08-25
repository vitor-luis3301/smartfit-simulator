extends Node2D

@export var GridSizeX = 33
@export var GridSizeY = 20
@export var Dic = {}
@export var canClick : bool = true

var spawnedEntity

var selectedItem = 0

var items = [
	"small_weight",
	"med_weight",
	"big_weight",
	"Giga_weight",
	"threadmill",
	"mat"
]

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
	var currentequip = %smol_equip
	
	var tile = %smol_select.local_to_map(mouse)
	%beeg_select.clear()
	if selectedItem >= 2:
		currentselect = %beeg_select
		currentequip = %beeg_equip
		tile = %beeg_select.local_to_map(mouse)
		%smol_select.clear()
	
	# add marker for every tile that mouse is on top of
	for x in GridSizeX:
		for y in GridSizeY:
			currentselect.erase_cell(Vector2(x,y))
	
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
	var tilesize = 32 # change sample_equipments collisions' sizes to this
	if selectedItem >= 2:
		tilesize = 96
	
	var equipPosition = tilesize * tile + Vector2i(tilesize/2, tilesize/2)
	
	# Add equipment to the map when left mouse button is clicked
	if Input.is_action_just_pressed("left_button") and canClick == true:
		%smol_equip.set_cell(tile, selectedItem, Vector2i(0,0), 0)
		if selectedItem >= 2:
			%beeg_equip.set_cell(tile, selectedItem-2, Vector2i(0,0), 0)
		spawnedEntity = spawn_equipmens(tilesize, items[selectedItem], equipPosition)
	
	# Remove equipment to the map if right mouse button is clicked
	if Input.is_action_pressed("right_button"):
		%smol_equip.erase_cell(tile)
		if selectedItem >= 2:
			%beeg_equip.erase_cell(tile)
	
	if selectedItem+1 > items.size():
		%selectedItem.text = "null"
	else:
		%selectedItem.text = "Item: " + items[selectedItem]
	
	%selectedItem.text += "\nCan you click? "
	if canClick:
		%selectedItem.text += "Yes, you can!"
	else:
		%selectedItem.text += "No, you can't."
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func spawn_equipmens(size, type, mousePos):
	var newEquip = equipment.instantiate()
	newEquip.position = mousePos
	newEquip.get_node("collision").shape.size = Vector2(size, size)
	
	add_child(newEquip)
	return newEquip

func delete_equipments():
	pass

func _on_button_pressed():
	$NavigationRegion2D.bake_navigation_polygon()
	await $NavigationRegion2D.bake_finished
	$Spawner.spawn(spawnedEntity)
