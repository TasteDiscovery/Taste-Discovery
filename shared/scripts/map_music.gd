extends AudioStreamPlayer

func _ready():
	if GlobalSettings.enableMusic:
		play()
