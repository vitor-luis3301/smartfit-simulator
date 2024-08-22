extends Node2D

@export var GridSizeX = 33
@export var GridSizeY = 20
@export var Dic = {}

var selectedItem = 0

var items = [
	"med_weight",
	"big_weight",
	"threadmill"
]

func _ready() -> void:
	for x in GridSizeX:
		for y in GridSizeY:
			Dic[str(Vector2(x,y))] = {
				"Type" : "Floor"
			}
			$'Layer-1'.set_cell(Vector2(x, y), 0, Vector2i(0, 0), 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	
	var tile = $Layer0.local_to_map(mouse)
	$Layer2.clear()
	if selectedItem >= 2:
		tile = $Layer3.local_to_map(mouse)
		$Layer0.clear()
	
	for x in GridSizeX:
		for y in GridSizeY:
			$Layer0.erase_cell(Vector2(x,y))
			if selectedItem >= 2:
				$Layer2.erase_cell(Vector2(x,y))
	
	if Dic.has(str(tile)):
		$Layer0.set_cell(tile, 1, Vector2i(0,0), 0)
		if selectedItem >= 2:
			$Layer2.set_cell(tile, 0, Vector2i(0,0), 0)
			
	if Input.is_action_just_pressed("select_down"):
		selectedItem += 1
	if Input.is_action_just_pressed("select_up"):
		selectedItem -= 1
	if selectedItem < 0:
		selectedItem = 0
	
	if Input.is_action_pressed("left_button"):
		$Layer1.set_cell(tile, selectedItem, Vector2i(0,0), 0)
		if selectedItem >= 2:
			$Layer3.set_cell(tile, selectedItem-2, Vector2i(0,0), 0)
	if Input.is_action_pressed("right_button"):
		$Layer1.erase_cell(tile)
		if selectedItem >= 2:
			$Layer3.erase_cell(tile)
		
	
	if selectedItem+1 > items.size():
		%selectedItem.text = "null"
	else:
		%selectedItem.text = "[rainbow][wave]" + "Item: " + items[selectedItem] + "[/wave][/rainbow]"
