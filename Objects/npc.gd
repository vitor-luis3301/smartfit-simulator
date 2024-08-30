extends CharacterBody2D

@export var target: Node2D
@export var objective : String

var speed = 100
var acceleration = 7

@onready var navigation_agent: NavigationAgent2D = $Navigation/NavigationAgent2D

func instance_place():
	var bodies : Array = []
	for i in $Area2D.get_overlapping_areas():
		bodies.append(i)
	
	if bodies.size() > 0:
		return bodies[0]
	return null

func _ready() -> void:
	objective = Global.equipments[randi_range(0, Global.equipments.size()-1)]
	
	var foundTarg = false
	
	for i in Global.environment:
		if i[0] == objective:
			if i[2] == true:
				target = i[3]
				i[2] = false
				foundTarg = true
				break
	
	if foundTarg == false:
		queue_free()

func _physics_process(delta):
	$Sprite2D/AnimationPlayer.play("corre")
	var direction = Vector2.ZERO
	
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed, acceleration * delta)
	
	move_and_slide()
	
	if instance_place():
		if instance_place() == target:
			await get_tree().create_timer(1).timeout
			queue_free()

func _on_timer_timeout():
	if target:
		navigation_agent.target_position = target.global_position
