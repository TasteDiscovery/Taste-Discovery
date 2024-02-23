extends Node

class_name SettingService

const FILE_NAME =  "setting.tres"

func save_data():
	var settingData = SettingData.new()
	settingData.enableMusic = GlobalSettings.enableMusic
	settingData.enableSoundEffects = GlobalSettings.enableSoundEffects
	settingData.volume = GlobalSettings.volume

func load_data():
	var settingData = ResourceLoader.load(FILE_NAME)
	
	if settingData == null: 
		return
	
	GlobalSettings.enableMusic = settingData.enableMusic
	GlobalSettings.enableSoundEffects = settingData.enableSoundEffects
	GlobalSettings.volume = settingData.volume
