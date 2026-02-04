extends CanvasLayer


func _on_button_pressed() -> void:
	var manager = AppStateManager.get_singleton()
	manager.new_game()
