extends Control

@export var skinIndice: int

var dataService = DataService.new()

func _ready():
	$Skin.texture = load(GlobalPlayer.skins[skinIndice]["sprite"])
	update_locked()

func update_locked():
	var islocked = GlobalPlayer.skins[skinIndice]["locked"]
	$LokedControl.visible = islocked
	$Button.disabled = islocked

func _on_button_pressed():
	owner.on_skin_selected(skinIndice)

func _on_button_2_pressed():
	if GlobalPlayer.moneys >= 100:
		GlobalPlayer.moneys -= 100
		GlobalPlayer.skins[skinIndice]["locked"] = false
		await update_locked()
		dataService.save_game_data()
