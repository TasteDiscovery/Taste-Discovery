extends Control

func _ready():
	$MoneyControl.update_value()
	if GlobalSettings.enableMusic:
		$AudioStreamPlayer.play()
	$Skin/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://restaurant/scenes/restaurant.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_skin_pressed():
	get_tree().change_scene_to_file("res://shared/scenes/skin_slector.tscn")
