extends Control

func update_time(time):
	$TimeScore/TimeLabel.text = "%03d" % time

func update_correct(counter):
	$CorrectAppleControl/CorrecAppleLabel.text = "%02d" % counter

func set_objetive(number):
	$CorrectAppleControl/ObjetiveNumber.text= "%02d" % number
	
func set_required(indice:int):
	$CorrectAppleControl/Sprite2D.frame = indice
