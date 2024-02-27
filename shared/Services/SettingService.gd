extends Node

class_name SettingService

const PATH =  "user://settings.cfg"
const SECTION = "settings"

func save_data():
	
	var config = ConfigFile.new()
	config.set_value(SECTION,"music",GlobalSettings.enableMusic)
	config.set_value(SECTION,"effect",GlobalSettings.enableSoundEffects)
	config.set_value(SECTION,"volumeMusic",GlobalSettings.volumeMusic)
	config.set_value(SECTION,"volumeEffects",GlobalSettings.volumeSfx)
	config.save(PATH)

func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	
	GlobalSettings.enableMusic = config.get_value(SECTION,"music",GlobalSettings.enableMusic)
	GlobalSettings.enableSoundEffects = config.get_value(SECTION,"effect",GlobalSettings.enableSoundEffects)
	GlobalSettings.volumeMusic = config.get_value(SECTION,"volumeMusic",GlobalSettings.volumeMusic)
	GlobalSettings.volumeSfx = config.get_value(SECTION,"volumeEffects",GlobalSettings.volumeSfx)
