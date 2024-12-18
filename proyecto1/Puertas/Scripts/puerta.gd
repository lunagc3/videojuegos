extends Node2D
@export var es_entrada: bool=true
var pos_puerta_salida:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var my_group = get_groups()
	var puertas_en_grupo = get_tree().get_nodes_in_group(my_group[0])
	for puerta in puertas_en_grupo:
		if puerta!=self:
			pos_puerta_salida=puerta.global_position
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if es_entrada && pos_puerta_salida!=body.global_position:
		body.transportar_jugador(pos_puerta_salida)
