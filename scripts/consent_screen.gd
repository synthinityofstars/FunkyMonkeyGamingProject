extends Control


# Toggles Big Bitch Mode (fullscreen)
func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

# Toggles the Breaking Bad Mexico Filter
func _on_mexico_filter_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$MexicoFilterRect.show()
	else:
		$MexicoFilterRect.hide()
		
		
