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

###Verificar si la mision se cumplio
func mision_completed():
	var set1 = array_unique(inventary)
	var set2 = array_unique(Mision1)
	return sets_are_equal(set1, set2)

func array_unique(array: Array) -> Array:
	var unique: Array = []
	for item in array:
		if not unique.has(item):
			unique.append(item)
	return unique


func sets_are_equal(set1, set2):
	set1.sort()
	set2.sort()
	return set1 == set2

