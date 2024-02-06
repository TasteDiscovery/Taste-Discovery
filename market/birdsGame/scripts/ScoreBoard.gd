extends Control


func update_time(time):
	$TimeScore/TimeLabel.text = "%03d" % time

func update_correct_bird(counter):
	$CorrectBirdControl/CorrecLabel.text = "%02d" % counter

func set_objetive_birds(number):
	$CorrectBirdControl/ObjetiveNumber.text= "%02d" % number
