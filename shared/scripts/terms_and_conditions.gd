extends Control

signal accepted

func _on_accept_pressed():
	accepted.emit()
