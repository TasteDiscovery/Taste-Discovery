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

####VARIABLES DEL JUGADOR
var first_chamba = true

var inventary = []

var has_mision = false

var player_current_try_interact = false

var can_move = true
var already_interact = false

#####VARIABLES RESTAURANTE
var can_exit_restaurante = false


#####VARIABLES PARA EL BOSQUE
var first_interaction_with_lady = true
var forest_quest_is_completed = false

