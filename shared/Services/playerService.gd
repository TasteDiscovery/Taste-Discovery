extends Node

class_name PlayerService

const PATH =  "user://player.cfg"
const SECTION = "player"

func save_data():
	var config = ConfigFile.new()
	config.set_value(SECTION,"dialog",GlobalPlayer.inDialog)
	config.set_value(SECTION,"mision",GlobalPlayer.inMision)
	config.set_value(SECTION,"money",GlobalPlayer.moneys)
	config.set_value(SECTION,"name",GlobalPlayer.playerName)
	config.set_value(SECTION,"skin",GlobalPlayer.skin)
	config.set_value(SECTION,"preview",GlobalPlayer.skinPreview)
	config.set_value(SECTION,"skins",GlobalPlayer.skins)
	config.save(PATH)

func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	
	GlobalPlayer.inDialog = config.get_value(SECTION,"dialog",GlobalPlayer.inDialog)
	GlobalPlayer.inMision = 	config.get_value(SECTION,"mision",GlobalPlayer.inMision)
	GlobalPlayer.moneys = 	config.get_value(SECTION,"money",GlobalPlayer.moneys)
	GlobalPlayer.playerName = 	config.get_value(SECTION,"name",GlobalPlayer.playerName)
	GlobalPlayer.skin = 	config.get_value(SECTION,"skin",GlobalPlayer.skin)
	GlobalPlayer.skinPreview = 	config.get_value(SECTION,"preview",GlobalPlayer.skinPreview)
	GlobalPlayer.skins = 	config.get_value(SECTION,"skins",GlobalPlayer.skins)

func delete_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	config.clear()
	config.save(PATH)
