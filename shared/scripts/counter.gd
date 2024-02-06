extends Control

signal start_game

@export var counter = 3

func _ready():
	GlobalPlayer.inDialog = true

func _on_timer_timeout():
	counter -= 1
	if counter >= 1:
		$Label.text = str(counter)
	elif counter == 0:
		$Label.text = "GO"
	else:
		$Timer.autostart = false
		$Timer.stop()
		GlobalPlayer.inDialog = false
		start_game.emit()
