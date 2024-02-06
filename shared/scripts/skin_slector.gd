extends Control

var localSkin = GlobalPlayer.skin

func _ready():
	GlobalPlayer.inDialog = true
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_button_pressed():
	GlobalPlayer.inDialog = false
	GlobalPlayer.skin = localSkin
	get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")
	
func _on_skin_button_1_pressed():
	localSkin = "res://shared/skins/default_player.tscn"
	GlobalPlayer.skinPreview = "res://resource/assets/skins/PlayerOriginal.png"
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_skin_button_2_pressed():
	localSkin = "res://shared/skins/default_female_player.tscn"
	GlobalPlayer.skinPreview = "res://resource/assets/skins/FemalePlayerOriginal.png"
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)
