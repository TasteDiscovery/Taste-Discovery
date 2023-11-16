extends CharacterBody2D

var player_is_beside = false

func charlar():
	DialogueManager.show_example_dialogue_balloon(load("res://Scenes/restaurant/Dialog/main_restaurant_dialog.dialogue"),"main_restaurant_dialog")
	

func npc_interaction():
	charlar()

func _process(delta):
	if PRINCIPAL_GLOBAL.player_current_try_interact == true and player_is_beside == true and PRINCIPAL_GLOBAL.is_already_show_dialog == false:
		PRINCIPAL_GLOBAL.player_current_try_interact = false
		npc_interaction()
		print(PRINCIPAL_GLOBAL.player_current_try_interact)


func _on_area_interact_jefe_body_entered(body):
	player_is_beside = true


func _on_area_interact_jefe_body_exited(body):
	player_is_beside = false
