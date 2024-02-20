extends Control

var localSkin = GlobalPlayer.skin
var skinIndice:int = 0

func _ready():
	if GlobalSettings.enableMusic:
		$AudioStreamPlayer.play()
	GlobalPlayer.inDialog = true
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_button_pressed():
	GlobalPlayer.inDialog = false
	GlobalPlayer.skin = localSkin
	get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")

func set_skin():
	localSkin = GlobalPlayer.skins[skinIndice]["scene"]
	GlobalPlayer.skinPreview =  GlobalPlayer.skins[skinIndice]["sprite"]
	$SkinPreview/Sprite2D.texture = load(GlobalPlayer.skinPreview)

func _on_skin_1_selected():
	skinIndice = $SkinSelector/Rows/Skins/skin1.skinIndice
	set_skin()

func _on_skin_2_selected():
	skinIndice = $SkinSelector/Rows/Skins/skin2.skinIndice
	set_skin()

func _on_skin_3_selected():
	skinIndice = $SkinSelector/Rows/Skins/skin3.skinIndice
	set_skin()
