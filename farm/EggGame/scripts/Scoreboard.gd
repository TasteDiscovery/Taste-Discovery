extends Control

func update_time(time):
	$TimeScore/TimeLabel.text = "%03d" % time

func update_correct(counter):
	$EggControl/EggCounterLabel.text = "%02d" % counter

func set_objetive(number):
	$EggControl/ObjetiveNumber.text= "%02d" % number

func update_score(score):
	$ScoreControl/ScoreLabel.text = "%03d" % score
