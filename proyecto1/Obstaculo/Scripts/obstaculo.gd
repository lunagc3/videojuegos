extends Node2D
@export var alturatrigger: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if alturatrigger!= Vector2(0,0) :
		$Trigger.position = alturatrigger
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $RigidBody2D/RayCast2D.is_colliding():
		print("colisiona")
		queue_free()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Jugador:
		area.get_parent().die()
		queue_free()
