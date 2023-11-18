extends StaticBody2D





func _on_area_2d_body_entered(body):
	if body.name == "player":
		await DialogueManager.show_example_dialogue_balloon(load("res://Scenes/Way/dialog/way_dialogs.dialogue"),"no_exit_area")
