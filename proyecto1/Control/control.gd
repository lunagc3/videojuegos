extends Control

func _ready() -> void:
	hide()
	resume()
	
func pause():
	get_tree().paused = true
	show()
	
func resume():
	get_tree().paused = false
	hide()

func escape():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume() # Replace with function body.


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene() # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.

func _process(delta: float) -> void:
	escape()
