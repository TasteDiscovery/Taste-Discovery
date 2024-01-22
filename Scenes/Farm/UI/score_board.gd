extends Control

@onready var timeControl = $TimeControl/TimeLabel
@onready var scoreControl = $ScoreControl/ScoreLabel

func update_time(time):
	timeControl.text = str(time)

func update_score(score):
	scoreControl.text = "%04d" % score
