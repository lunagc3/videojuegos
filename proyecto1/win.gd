extends Control

var estrellas_label : Label
var items = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	estrellas_label = $LabelPuntaje # Replace with function body.
	var cant_items = items.size()
	var estrellas = get_estrellas(cant_items)
	var retry = $Button
	if(estrellas=="1"):
		estrellas_label.text = "Puntaje final: " + estrellas + " estrella"
	else:
		estrellas_label.text = "Puntaje final: " + estrellas + " estrellas"
	print(estrellas)
	
	retry.pressed.connect(_on_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_estrellas(cant_items):
	if cant_items>=17:
		return "3"
	elif cant_items>=9 and cant_items<17:
		return "2"
	elif cant_items>=3 and cant_items<9:
		return "1"
	else:
		return "0"


func _on_button_pressed() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://Niveles/Escenas/nivel_1.tscn") 
	
	 # Replace with function body.
