extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	%levantaPeso.play("pesos")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Button.button_pressed:
		await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file("res://Scenes/academia.tscn")
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
