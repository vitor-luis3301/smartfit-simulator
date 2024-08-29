extends Area2D

var initPos = 251
var speed = 7.5
var playing : bool = true

func instance_place():
	var areas : Array = []
	for i in get_overlapping_areas():
		areas.append(i)
	
	if areas.size() > 0:
		return areas[0]
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	if not instance_place():
		speed = -speed
	
	if playing:
		position.x = position.x + speed
		
		if Input.is_action_just_pressed("ui_accept"):
			if %mlkDosPesos.frame == 0: %mlkDosPesos.frame = 1
			else: %mlkDosPesos.frame = 0
			if instance_place():
				if instance_place().name == "Yellow":
					%Fillment.size.x += 10
				elif instance_place().name == "Green":
					%Fillment.size.x += 20
				elif instance_place().name == "Red":
					%Fillment.size.x += 30
				elif instance_place().name == "Perfect":
					%Fillment.size.x += 65
				print(instance_place().name)
			position.x = initPos
		if %Fillment.size.x > 0:
			%Fillment.size.x -= 0.6
	else:
		%treinador.play("whistle")
		
	if %Fillment.size.x >= 436:
		%Fillment.size.x = 436
		%WIN.text = "YOU WIN"
		playing = false
		if %mlkDosPesos.frame < 4: %levantaPeso.play("pesos") 
	elif %Fillment.size.x <= 0:
		%Fillment.size.x = 0
		%WIN.text = "YOU LOSE"
		playing = false
		%mlkDosPesos.frame = 2
	
	
	
