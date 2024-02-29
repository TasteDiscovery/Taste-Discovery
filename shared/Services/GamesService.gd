extends Node

class_name GamesService

const PATH =  "user://games.cfg"
const SECTION = "games"

func save_data():
	var config = ConfigFile.new()
	config.set_value(SECTION,"farm",GlobalGames.previewFarmGame)
	config.set_value(SECTION,"forest",GlobalGames.previewForestGame)
	config.set_value(SECTION,"market",GlobalGames.previewMarketGame)
	config.save(PATH)

func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	
	GlobalGames.previewFarmGame = config.get_value(SECTION,"farm",GlobalGames.previewFarmGame)
	GlobalGames.previewForestGame = config.get_value(SECTION,"forest",GlobalGames.previewForestGame)
	GlobalGames.previewMarketGame = config.get_value(SECTION,"market",GlobalGames.previewMarketGame)

func delete_data():
	pass
