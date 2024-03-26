extends Control


func update_time(time):
	$TimeScore/TimeLabel.text = "%03d" % time

func update_score(score):
	$ScoreControl/Score.text = "%03d" % score
