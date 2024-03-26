extends CharacterBody2D

var indice: int = 32

func create(_indice:int):
	indice = _indice
	$Sprite2D.frame = indice

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		var shopping_zone = get_parent()
		if shopping_zone == null: return
		var game = shopping_zone.get_parent()
		if game == null: return
		game.add_ingredients(indice)
