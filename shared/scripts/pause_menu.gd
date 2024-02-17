extends Control

func set_config():
	$PauseButton.visible = not $PauseButton.visible
	$Menu.visible = not $Menu.visible
	get_tree().paused = not get_tree().paused

func _input(event):
	if event.is_action_pressed('pause'):
		set_config()

func _on_button_pressed():
	set_config()

func _on_pause_button_pressed():
	if not GlobalPlayer.inDialog:
		set_config()

func _on_button_2_pressed():
	set_config()
	get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")

func _on_button_4_pressed():
	set_config()
	get_tree().quit()
