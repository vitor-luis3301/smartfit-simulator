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
	
	if area:
		if area.is_in_group("equipments") and area.help_needed == true:
			if Input.is_action_just_pressed("left_button"):
				minigame(instance_place().excercise)
		else:
			owner.canClick = false
	else:
		owner.canClick = true
		

func minigame(excercise):
	if excercise == "peso_peq":
		get_tree().change_scene_to_file("res://Scenes/minigames/peso_peq/minigame-pesos-peq.tscn")
	if excercise == "peso_med":
		get_tree().change_scene_to_file("res://Scenes/minigames/peso_med/minigame-pesos-med.tscn")
	if excercise == "peso_gran":
		get_tree().change_scene_to_file("res://Scenes/minigames/peso_gran/minigame-pesos-gran.tscn")
	if excercise == "peso_giga":
		get_tree().change_scene_to_file("res://Scenes/minigames/peso_giga/minigame-pesos-giga.tscn")
	if excercise == "esteira":
		get_tree().change_scene_to_file("res://Scenes/minigames/esteira/minigame-esteira.tscn")
	if excercise == "tapete":
		get_tree().change_scene_to_file("res://Scenes/minigames/ginastica/minigame-ginastica.tscn")
