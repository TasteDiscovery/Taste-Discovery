extends CharacterBody2D

signal start_game

var enableChat = true

func _on_dialog_area_body_entered(body):
	if body.get_name() == 'player':
		$NPCDialog.visible = true
		enableChat = true

func _input(event):
	if event.is_action_pressed("ui_accept") and enableChat and not PRINCIPAL_GLOBAL.already_interact:
		DialogueManager.show_example_dialogue_balloon(load("res://Scenes/Farm/Dialog/farmer.dialogue"),"start")

func _on_dialog_area_body_exited(body):
	if body.get_name() == 'player':
		$NPCDialog.visible = false
		enableChat = false
		if PRINCIPAL_GLOBAL.farm_mision_accepted and not PRINCIPAL_GLOBAL.farm_mision_completed:
			start_game.emit()
