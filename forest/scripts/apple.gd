extends Area2D

var isCorrect: bool = false
var enableselect: bool = false

func create(correct:bool):
	isCorrect = correct
	if isCorrect:
		$Sprite2D.frame = 0
	else:
		$Sprite2D.frame = randi_range(1,8)

func _input(event):
	if event.is_action_pressed("ui_accept") and enableselect:
		get_parent().get_parent().apple_collected(isCorrect)
		queue_free()

func _on_body_entered(body):
	if body.get_name().contains("Player"):
		enableselect = true

func _on_body_exited(body):
	if body.get_name().contains("Player"):
		enableselect = false
