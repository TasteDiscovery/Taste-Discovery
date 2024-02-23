extends Node

class_name DataService

var playerService = PlayerService.new()
var dialogService = DialogService.new()
var misionService = MisionService.new()

func save_game_data():
	playerService.save_data()
	dialogService.save_data()
	misionService.save_data()
