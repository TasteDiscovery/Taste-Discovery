extends Node

class_name DialogService

const PATH =  "user://dialog.cfg"
const SECTION = "dialog"

func save_data():
	var config = ConfigFile.new()
	config.set_value(SECTION,"boss",GlobalDialog.firstBossMetting)
	config.set_value(SECTION,"first",GlobalDialog.firstDialog)
	config.set_value(SECTION,"farmer",GlobalDialog.firstFarmerMetting)
	config.set_value(SECTION,"lumberJack",GlobalDialog.firstLumberJackMetting)
	config.set_value(SECTION,"seller",GlobalDialog.firstSellerMetting)
	config.save(PATH)

func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	
	GlobalDialog.firstBossMetting = config.get_value(SECTION,"boss",GlobalDialog.firstBossMetting)
	GlobalDialog.firstDialog = config.get_value(SECTION,"first",GlobalDialog.firstDialog)
	GlobalDialog.firstFarmerMetting = config.get_value(SECTION,"farmer",GlobalDialog.firstFarmerMetting)
	GlobalDialog.firstLumberJackMetting = config.get_value(SECTION,"lumberJack",GlobalDialog.firstLumberJackMetting)
	GlobalDialog.firstSellerMetting = config.get_value(SECTION,"seller",GlobalDialog.firstSellerMetting)

func delete_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	config.clear()
	config.save(PATH)
	restore_default()

func restore_default():
	var dialog = DialogData.new()
	GlobalDialog.firstBossMetting = dialog.firstBossMetting
	GlobalDialog.firstDialog = dialog.firstDialog
	GlobalDialog.firstFarmerMetting = dialog.firstFarmerMetting
	GlobalDialog.firstLumberJackMetting = dialog.firstLumberJackMetting
	GlobalDialog.firstSellerMetting = dialog.firstSellerMetting
