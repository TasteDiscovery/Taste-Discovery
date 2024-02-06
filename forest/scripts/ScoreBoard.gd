extends Control


func update_time(time):
	$TimeScore/TimeLabel.text = "%03d" % time

func update_correct_apple(counter):
	$CorrectAppleControl/CorrecAppleLabel.text = "%02d" % counter

func update_total_apple(counter):
	$TotalAppleControl/TotalAppleLabel.text = "%02d" % counter

func set_objetive_apples(number):
	$CorrectAppleControl/ObjetiveNumber.text= "%02d" % number
