extends Control

func update_score(score):
	$ScoreControl/Panel/Score.text = str(score)

func update_round(round):
	$RoundsControl/Panel/Score.text = str(round)
