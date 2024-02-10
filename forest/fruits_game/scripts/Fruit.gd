extends Area2D

var isCorrect: bool = false
var enableselect: bool = false

func create(correct:bool, correctIndice: int):
	isCorrect = correct
	var indice = correctIndice
	if isCorrect:
		$Sprite2D.frame = correctIndice
	else:
		while (indice == correctIndice):
			indice = randi_range(0,15)
		$Sprite2D.frame  = indice

func _input(event):
	if event.is_action_pressed("ui_accept") and enableselect:
		get_parent().get_parent().collected(isCorrect)
		queue_free()

func _on_body_entered(body):
	if body.get_name().contains("Player"):
		enableselect = true

func _on_body_exited(body):
	if body.get_name().contains("Player"):
		enableselect = false
