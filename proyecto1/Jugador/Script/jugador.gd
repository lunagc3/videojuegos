extends CharacterBody2D

class_name Jugador
var inventario = []
const SPEED = 300.0
const JUMP_VELOCITY = -500.0 #Crece para abajo xq es y

#En este se pone todo el control de fisica
#delta time indica cuantos miliseg pasaron desde el ultimo frame (para calculo exacto)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if (position.y >= 500):
		die()
	move_and_slide()
	
func agregar_inventario(item)-> void:
	inventario.append(item)
	print("recogido ", item, "inventario", inventario)

func transportar_jugador(pos_puerta_salida: Vector2)->void:
	global_position = pos_puerta_salida
	
	
func die()->void:
	position = Vector2(0,0)
	inventario = []
	print(inventario)
	
func _on_level_complete():
	var pantalla_victoria = preload("res://win.tscn").instantiate()
	pantalla_victoria.items = inventario
	get_tree().current_scene.get_parent().add_child(pantalla_victoria)
	get_tree().change_scene_to_packed(pantalla_victoria)
	print("cambio escena")
	get_tree().current_scene.queue_free()
	
func _ready() -> void:
	add_to_group("player")
