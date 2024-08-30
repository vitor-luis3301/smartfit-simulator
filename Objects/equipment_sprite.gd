extends Sprite2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("npc"):
		owner.excercise = area.owner.objective
		await get_tree().create_timer(1).timeout
		if area.needHelp == false:
			if owner.type == "peso_min" or owner.type == "peso_med" or owner.type == "peso_gran":
				texture = load("res://Assets/sprites/Characters/pequenosExercicios.png")
				hframes = 2
				vframes = 3
				$AnimationPlayer.play("pesos")
			elif owner.type == "peso_giga":
				texture = load("res://Assets/sprites/Characters/pequenosExercicios.png")
				hframes = 2
				vframes = 3
				$AnimationPlayer.play("giga")
			elif owner.type == "esteira":
				texture = load("res://Assets/sprites/Characters/spr_mlkMini.png")
				hframes = 3
				vframes = 1
				$AnimationPlayer.play("corra")
			elif owner.type == "tapete":
				texture = load("res://Assets/sprites/Characters/pequenosExercicios.png")
				hframes = 2
				vframes = 3
				$AnimationPlayer.play("abdominal")
		else:
			texture = load("res://Assets/sprites/Characters/spr_mlkMini.png")
			hframes = 3
			vframes = 1
			owner.help_needed = true
