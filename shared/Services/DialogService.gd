extends Node

class_name DialogService

const FILE_NAME =  "dialog.tres"

func save_data():
	var dialogData = DialogData.new()
	dialogData.firstBossMetting = GlobalDialog.firstBossMetting
	dialogData.firstDialog = GlobalDialog.firstDialog
	dialogData.firstFarmerMetting = GlobalDialog.firstFarmerMetting
	dialogData.firstLumberJackMetting = GlobalDialog.firstLumberJackMetting
	dialogData.firstSellerMetting = GlobalDialog.firstSellerMetting
	ResourceSaver.save(dialogData,FILE_NAME)

func load_data():
	var dialogData = ResourceLoader.load(FILE_NAME)
	
	if dialogData == null: 
		return
	
	GlobalDialog.firstBossMetting = dialogData.firstBossMetting
	GlobalDialog.firstDialog = dialogData.firstDialog
	GlobalDialog.firstFarmerMetting = dialogData.firstFarmerMetting
	GlobalDialog.firstLumberJackMetting = dialogData.firstLumberJackMetting
	GlobalDialog.firstSellerMetting = dialogData.firstSellerMetting
