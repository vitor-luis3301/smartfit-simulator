extends Area2D

var initPos = 251
var speed = 15
var playing : bool
var started : bool = false

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
	
	%WIN.text = str(int(%Timer.time_left)+1)
	if %Timer.time_left <= 0 and started == false:
		%WIN.text = "GO!"
		playing = true
		started = true
	
	if playing:
		position.x = position.x + speed
		
		if %mlkDosPesos.frame == 0:
			%levantaPeso.play("dificuldade")
		
		if Input.is_action_just_pressed("ui_accept"):
			if %mlkDosPesos.frame == 0: 
				%levantaPeso.stop()
				%mlkDosPesos.frame = 2
			else: %mlkDosPesos.frame = 0
			if instance_place():
				if instance_place().name == "Yellow":
					%Fillment.size.x += 6
				elif instance_place().name == "Green":
					%Fillment.size.x += 15
				elif instance_place().name == "Red":
					%Fillment.size.x += 35
				elif instance_place().name == "Perfect":
					%Fillment.size.x += 95
			position.x = initPos
		if %Fillment.size.x > 0:
			%Fillment.size.x -= 0.7
	else:
		%treinador.play("whistle")
		
	if %Fillment.size.x >= 436:
		%Fillment.size.x = 436
		%WIN.text = "YOU WIN"
		playing = false
		if %mlkDosPesos.frame < 3: %levantaPeso.play("pesos") 
	elif %Fillment.size.x <= 0:
		%Fillment.size.x = 0
		%WIN.text = "YOU LOSE"
		playing = false
		%mlkDosPesos.frame = 4
