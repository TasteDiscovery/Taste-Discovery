extends Control

signal player_renamed()

var playerService = PlayerService.new()

func _on_no_pressed():
	visible = false

func _on_yes_pressed():
	GlobalPlayer.playerName = $NameEdit/MarginContainer2/LineEdit.text
	await playerService.save_data()
	player_renamed.emit()
	visible = false
