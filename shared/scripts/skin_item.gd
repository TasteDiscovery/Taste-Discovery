extends Control

@export var skinIndice: int

var playerService = PlayerService.new()

func _ready():
	$Skin.texture = load(GlobalPlayer.skins[skinIndice]["sprite"])
	update_locked()

func update_locked():
	var islocked = GlobalPlayer.skins[skinIndice]["locked"]
	$LokedControl.visible = islocked
	$Button.disabled = islocked
	$LokedControl/Button2.text = str(GlobalPlayer.skins[skinIndice]["price"])

func _on_button_pressed():
	owner.on_skin_selected(skinIndice)

func _on_button_2_pressed():
	if GlobalPlayer.moneys >= GlobalPlayer.skins[skinIndice]["price"]:
		GlobalPlayer.moneys -= 100
		GlobalPlayer.skins[skinIndice]["locked"] = false
		await update_locked()
		playerService.save_data()
