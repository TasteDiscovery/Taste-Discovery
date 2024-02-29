extends Node

class_name DataService

var playerService = PlayerService.new()
var dialogService = DialogService.new()
var misionService = MisionService.new()
var gamesService = GamesService.new()

func save_game_data():
	playerService.save_data()
	dialogService.save_data()
	misionService.save_data()
	gamesService.save_data()

func delete_game_data():
	playerService.delete_data()
	dialogService.delete_data()
	misionService.delete_data()
