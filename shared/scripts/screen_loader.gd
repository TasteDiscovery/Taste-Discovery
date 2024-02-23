extends Control

var playerService = PlayerService.new()
var dialogService = DialogService.new()
var misionService = MisionService.new()
var progress = 0

func _ready():
	await playerService.load_data()
	increment(33)
	await dialogService.load_data()
	increment(33)
	await misionService.load_data()
	increment(34)

func increment(value):
	progress += value
	$TextureProgressBar.value = progress
	$TextureProgressBar/Label.text = ("%02d" % progress) + "%"

func _on_texture_progress_bar_value_changed(value):
	if value == 100:
		get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")
