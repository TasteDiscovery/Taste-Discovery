extends Node

enum ingredients {
	APPLE,
	RISE,
	CARROT,
	POTATO,
	ORANGE
}

var Mision1 = [
	ingredients.APPLE,
	ingredients.RISE
]

var inventary = []

var has_mision = false

var player_current_try_interact = false


# Esto es para la interacción con el dialogo
var current_dialog_index = -1
var is_already_show_dialog = false

var dialog_array = []
func show_dialog(current_dialog):
	dialog_array = current_dialog
	is_already_show_dialog = true
	#instance.visible = true
	next_script()
	
func next_script():
	current_dialog_index +=1
	if current_dialog_index >= len(dialog_array):
		hide_dialog()
		return
	#instance.text = dialog_object[current_dialog][current_dialog_index]
	print(dialog_array[current_dialog_index])
	
func hide_dialog():
	is_already_show_dialog = false
	current_dialog_index = -1
#	instance.visible = false

func _input(event):
	if is_already_show_dialog == false:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
