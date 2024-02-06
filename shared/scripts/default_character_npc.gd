extends CharacterBody2D

class_name DefaultCharacterNPC

var enableDialog = false

@onready var dialogBallon = $DialogBalloon

func _on_dialog_area_body_entered(body):
	if body.get_name().find('Player') != -1:
		dialogBallon.visible = true
		enableDialog = true


func _on_dialog_area_body_exited(body):
	if body.get_name().find('Player') != -1:
		dialogBallon.visible = false
		enableDialog = false

func _input(event):
	if event.is_action_pressed("ui_accept") and enableDialog  and not GlobalPlayer.inDialog:
		start_dialog()

func start_dialog():
	#Call character dialog here
	pass
