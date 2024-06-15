extends Control

signal player_renamed()

var playerService = PlayerService.new()

func _on_no_pressed():
	visible = false

func _on_yes_pressed():
	var newPlayerName = $NameEdit/MarginContainer2/LineEdit.text
	if newPlayerName == "": return;
	GlobalPlayer.playerName = newPlayerName
	await playerService.save_data()
	player_renamed.emit()
	visible = false
