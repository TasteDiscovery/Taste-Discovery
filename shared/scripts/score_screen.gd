extends Control

@export_file('*.tscn') var reload_scene

func result(percent, time):
	$Control/VBoxContainer/HBoxContainer/Complete.text = str(percent) + '%'
	$Control/VBoxContainer/HBoxContainer2/Time.text = str(time) + 's'
	if percent >= 50:
		set_complete_screen(percent)
	else:
		set_failed_screen()

func set_complete_screen(percent):
	give_stars(percent)	
	give_moneys(percent)

func give_stars(percent):
	if percent >= 81: print_stars(3)
	elif percent >= 65: print_stars(2)
	else: print_stars(1)

func set_failed_screen():
	$Title1.visible = false
	$Title2.visible = true

func give_moneys(percent):
	var moneys = 0
	if percent >= 50:
		moneys = (percent * 50) / 100
		GlobalPlayer.moneys += moneys
		$Control/Control/MoneyLabel.text = "%03d" % moneys

func print_stars(starsNumber):
	var stars = [$Stars/Start1,$Stars/Start2,$Stars/Start3]
	for i in starsNumber:
		stars[i].frame = 0

func _on_button_pressed():
	get_tree().change_scene_to_file("res://coast/scenes/coast.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://shared/scenes/main_menu.tscn")

func _on_button_3_pressed():
	if reload_scene != null:
		get_tree().change_scene_to_file(reload_scene)
