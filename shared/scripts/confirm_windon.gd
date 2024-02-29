extends Control

func _on_no_pressed():
	visible = false

func _on_yes_pressed():
	visible = false
	get_parent().on_confirmed()
