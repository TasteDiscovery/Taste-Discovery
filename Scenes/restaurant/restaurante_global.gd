extends Node2D

@onready var instance = get_node("/root/Restaurante/player/Camera2D/Dialog")

var player_current_try_interact = false

var player_has_cv = false
var is_already_show_dialog = false
var current_dialog = "primer_dialogo"
var current_dialog_index = -1


const dialogosPrimerRestaurant = {
	"primer_dialogo": [
		"Jugador: Bueno... ya estoy aquí, mi primer trabajo.",
		"Jugador: Me dijeron que venga a hablar con el jefe, me pregunto donde estará... será mejor que lo busque"
	],
	"primer_dialogo_jefe": [
		"Jefe: Hmmm? Quien eres? Esto muy ocupado preparando el restaurante para abrir hoy",
		"Jugador: Soy quien le envio una solicitud de trabajo, me dijo que venga hoy",
		"Jefe: Ah cierto!, eres el nuevo ayudante",
		"Jugador: Exactamente, es un gusto conocerlo señor",
		"Jefe: Justo estaba revisando tu curriculum, pero lo deje en algún lado del restaurante",
		"Jefe: Buscalo y traemelo",
		"OBJETIVO: Busca tus documentos en el restaurante"
	]
}

func _ready():
	show_dialog()

func _input(event):
	if is_already_show_dialog == false:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func show_dialog():
	is_already_show_dialog = true
	instance.visible = true
	next_script()
	
func next_script():
	current_dialog_index +=1
	if current_dialog_index >= len(dialogosPrimerRestaurant[current_dialog]):
		hide_dialog()
		return
	instance.text = dialogosPrimerRestaurant[current_dialog][current_dialog_index]
	
func hide_dialog():
	is_already_show_dialog = false
	current_dialog_index = -1
	instance.visible = false


