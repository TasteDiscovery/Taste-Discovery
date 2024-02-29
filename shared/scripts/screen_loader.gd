extends Control

var playerService = PlayerService.new()
var dialogService = DialogService.new()
var misionService = MisionService.new()
var settingService = SettingService.new()
var gamesService = GamesService.new()
var progress = 0

func _ready():
	await playerService.load_data()
	increment(20)
	await dialogService.load_data()
	increment(20)
	await misionService.load_data()
	increment(20)
	await settingService.load_data()
	await  set_settings()
	increment(20)
	await gamesService.load_data()
	increment(20)
	

func set_settings():
	AudioServer.set_bus_mute(1,not GlobalSettings.enableMusic)
	AudioServer.set_bus_volume_db(1,GlobalSettings.volumeMusic)
	
	AudioServer.set_bus_mute(2,not GlobalSettings.enableSoundEffects)
	AudioServer.set_bus_volume_db(2,GlobalSettings.volumeSfx)

func increment(value):
	progress += value
	$TextureProgressBar.value = progress
	$TextureProgressBar/Label.text = ("%02d" % progress) + "%"

func _on_texture_progress_bar_value_changed(value):
	if value == 100:
		get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")
