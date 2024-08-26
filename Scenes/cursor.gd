extends Area2D

@export var area : Area2D

func instance_place():
	var areas : Array = []
	for i in get_overlapping_areas():
		areas.append(i)
	
	if areas.size() > 0:
		return areas[0]
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position()
	
	area = instance_place()
	
	print(area)
	
	if instance_place():
		owner.canClick = false
	else:
		owner.canClick = true
