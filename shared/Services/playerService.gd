extends Node

class_name PlayerService

const FILE_NAME =  "player.tres"

func save_data():
	var playerData = PlayerData.new()
	playerData.inDialog = GlobalPlayer.inDialog
	playerData.inMision = GlobalPlayer.inMision
	playerData.inventary = GlobalPlayer.inventary
	playerData.moneys = GlobalPlayer.moneys
	playerData.playerName = GlobalPlayer.playerName
	playerData.skin = GlobalPlayer.skin
	playerData.skinPreview = GlobalPlayer.skinPreview
	playerData.skins = GlobalPlayer.skins
	
	ResourceSaver.save(playerData,FILE_NAME)

func load_data():
	var playerData = ResourceLoader.load(FILE_NAME)
	
	if playerData == null:
		return
	
	GlobalPlayer.inDialog = playerData.inDialog
	GlobalPlayer.inMision = playerData.inMision
	GlobalPlayer.inventary = playerData.inventary
	GlobalPlayer.moneys = playerData.moneys
	GlobalPlayer.playerName = playerData.playerName
	GlobalPlayer.skin = playerData.skin
	GlobalPlayer.skinPreview = playerData.skinPreview
	GlobalPlayer.skins = playerData.skins
