extends CharacterBody2D

var player_is_beside = false
var current_dialog = -1
var have_mission = false

var dialogs = [
	[
		"Jefe: Hmmm? Quien eres? Esto muy ocupado preparando el restaurante para abrir hoy",
		"Jugador: Soy quien le envio una solicitud de trabajo, me dijo que venga hoy",
		"Jefe: Ah cierto!, eres el nuevo ayudante",
		"Jugador: Exactamente, es un gusto conocerlo señor",
		"Jefe: Justo estaba revisando tu curriculum, pero lo deje en algún lado del restaurante",
		"Jefe: Buscalo y traemelo",
		"OBJETIVO: Busca tus documentos en el restaurante"
	],
	[
		"Jefe: ¿Trajiste el documento?, ¿no? ¿Que estas esperando?"
	]
]

func give_mission():
	if current_dialog == 0:
		have_mission = true
	if current_dialog == 2:
		have_mission = false

func charlar():
	if have_mission == false:
		give_mission()
		current_dialog +=1
	PRINCIPAL_GLOBAL.show_dialog(dialogs[current_dialog])
	

func npc_interaction():
	charlar()
	
	


func _process(delta):
	if PRINCIPAL_GLOBAL.player_current_try_interact == true and player_is_beside == true and PRINCIPAL_GLOBAL.is_already_show_dialog == false:
		PRINCIPAL_GLOBAL.player_current_try_interact = false
		npc_interaction()


func _on_area_interact_jefe_body_entered(body):
	player_is_beside = true


func _on_area_interact_jefe_body_exited(body):
	player_is_beside = false
