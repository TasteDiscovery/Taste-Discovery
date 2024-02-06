extends DefaultCharacterNPC

func start_dialog():
	DialogueManager.show_example_dialogue_balloon(load("res://restaurant/dialog/boss_dialog.dialogue"),"start")
