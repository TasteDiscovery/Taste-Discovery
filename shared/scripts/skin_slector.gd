extends Control

var localSkin = GlobalPlayer.skin
var playerService = PlayerService.new()

func _ready():
	if GlobalSettings.enableMusic:
		$AudioStreamPlayer.play()
	GlobalPlayer.inDialog = true
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_button_pressed():
	GlobalPlayer.inDialog = false
	GlobalPlayer.skin = localSkin
	playerService.save_data()
	get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")

func on_skin_selected(skinIndice):
	localSkin = GlobalPlayer.skins[skinIndice]["scene"]
	GlobalPlayer.skinPreview =  GlobalPlayer.skins[skinIndice]["sprite"]
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)
