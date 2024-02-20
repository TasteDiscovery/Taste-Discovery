extends AudioStreamPlayer

func play_sound():
	if GlobalSettings.enableSoundEffects:
		play()
