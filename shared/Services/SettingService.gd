extends Node

class_name SettingService

const FILE_NAME =  "setting.tres"

func save_data():
	var settingData = SettingData.new()
	settingData.enableMusic = GlobalSettings.enableMusic
	settingData.enableSoundEffects = GlobalSettings.enableSoundEffects
	settingData.volumeMusic = GlobalSettings.volumeMusic
	settingData.volumeSfx = GlobalSettings.volumeSfx
	
	ResourceSaver.save(settingData,FILE_NAME)

func load_data():
	var settingData = ResourceLoader.load(FILE_NAME)
	
	if settingData == null: 
		return
	
	GlobalSettings.enableMusic = settingData.enableMusic
	GlobalSettings.enableSoundEffects = settingData.enableSoundEffects
	GlobalSettings.volumeMusic = settingData.volumeMusic
	GlobalSettings.volumeSfx = settingData.volumeSfx
