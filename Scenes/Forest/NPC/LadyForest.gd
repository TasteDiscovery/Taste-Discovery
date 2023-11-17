extends CharacterBody2D

var player_is_beside = false
signal lady_forest_signal

func _process(delta):
	if PRINCIPAL_GLOBAL.player_current_try_interact == true and player_is_beside == true:
		PRINCIPAL_GLOBAL.player_current_try_interact = false
		npc_interaction()

func _on_area_2d_body_entered(body):
	player_is_beside = true

func charlar():
	if PRINCIPAL_GLOBAL.first_interaction_with_lady == true and PRINCIPAL_GLOBAL.can_move == true:
		PRINCIPAL_GLOBAL.first_interaction_with_lady = false
		DialogueManager.show_example_dialogue_balloon(load("res://Scenes/Forest/Dialogs/main_forest_dialogs.dialogue"),"first_talk_with_monica")
		

func dar_mision():
	pass
	
func npc_interaction():
	charlar()

func _on_area_2d_body_exited(body):
	player_is_beside = false
