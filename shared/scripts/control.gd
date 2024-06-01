extends Control

func _ready():
	$NameView/PanelContainer/MarginContainer/Name.text = GlobalPlayer.playerName
	$AudioStreamPlayer.play()
	$Skin/Sprite2D.texture = load(GlobalPlayer.skinPreview)
	if GlobalSettings.acceptTermsAndConditions:
		$TermsAndConditions.visible = false

func _on_start_pressed():
	get_tree().change_scene_to_file("res://restaurant/scenes/restaurant.tscn")

func _on_skin_pressed():
	get_tree().change_scene_to_file("res://shared/scenes/skin_slector.tscn")

func _on_settings_pressed():
	$SettingsMenu.visible = true

func _on_terms_and_conditions_accepted():
	GlobalSettings.acceptTermsAndConditions = true
	$SettingsMenu.settingService.save_data()
	$TermsAndConditions.visible = false

func _on_edit_name_pressed():
	$NameManager.visible = true

func _on_name_manager_player_renamed():
	$NameView/PanelContainer/MarginContainer/Name.text = GlobalPlayer.playerName
