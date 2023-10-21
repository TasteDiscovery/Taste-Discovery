extends CharacterBody2D

var player_is_beside = false

func npc_interaction():
	RestauranteGlobal.current_dialog = "primer_dialogo_jefe"
	RestauranteGlobal.show_dialog()


func _physics_process(delta):
	if RestauranteGlobal.player_current_try_interact == true and player_is_beside == true:
		RestauranteGlobal.player_current_try_interact = false
		npc_interaction()


func _on_area_interact_jefe_body_entered(body):
	player_is_beside = true


func _on_area_interact_jefe_body_exited(body):
	player_is_beside = false
