extends StaticBody2D


@onready var self_colider = $CollisionShape2D

func _on_area_2d_body_entered(body):
	if body.name == "player" and PRINCIPAL_GLOBAL.has_mision == false:
		await DialogueManager.show_example_dialogue_balloon(load("res://Scenes/restaurant/Dialog/main_restaurant_dialog.dialogue"),"no_exit_primera_chamba")

func _process(delta):
	if PRINCIPAL_GLOBAL.has_mision:
		self_colider.disabled = true
	else:
		self_colider.disabled = false
