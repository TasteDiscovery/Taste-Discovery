extends Control

signal closed()

var settingService = SettingService.new()

func _on_save_pressed():
	GlobalSettings.enableMusic = $VBoxContainer/MusicContainer/PanelConatiner/Mute.button_pressed
	GlobalSettings.enableSoundEffects = $VBoxContainer/EffectsConatiner/PanelConatiner/Mute.button_pressed
	GlobalSettings.volumeMusic = $VBoxContainer/VolumeVolumeConatiner/PanelConatiner/Volume_slider.value
	GlobalSettings.volumeSfx = $VBoxContainer/EffectsVolumeConatiner/PanelConatiner/Volume_slider.value
	await settingService.save_data()
	visible = false
	closed.emit()

func _on_volume_slider_value_changed(value):
	if visible:
		$PositiveSoundEffect.play()
