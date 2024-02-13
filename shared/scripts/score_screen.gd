extends Control

@onready var stars = [$Stars/Start1,$Stars/Start2,$Stars/Start3]

func result(percent, time):
	$Control/VBoxContainer/HBoxContainer/Complete.text = str(percent) + '%'
	$Control/VBoxContainer/HBoxContainer2/Time.text = str(time) + 's'
	give_stars(percent)	

func give_stars(percent):
	var starsNumber = 0
	if percent >= 81:
		starsNumber = 3
	elif percent >= 65:
		starsNumber = 2
	elif percent >= 50:
		starsNumber = 1
	
	if starsNumber != 0: print_stars(starsNumber)
		

func print_stars(starsNumber):
	for i in starsNumber:
		stars[i].frame = 0

func _on_button_pressed():
	get_tree().change_scene_to_file("res://coast/scenes/coast.tscn")
