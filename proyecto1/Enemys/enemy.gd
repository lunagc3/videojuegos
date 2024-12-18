extends CharacterBody2D

@export var speed = -300.0
var face_right = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void: 	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !$RayCast2D.is_colliding()&&is_on_floor():
		flip()
	velocity.x = speed
	move_and_slide()

func flip()->void:
	face_right = !face_right
	scale.x = abs(scale.x) * -1
	if face_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Jugador:
		area.get_parent().die() # Replace with function body.
