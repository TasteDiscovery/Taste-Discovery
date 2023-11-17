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
	print("habla p chacalito")

func dar_mision():
	pass
	
func npc_interaction():
	charlar()

func _on_area_2d_body_exited(body):
	player_is_beside = false
