extends DefaultCharacterNPC

func start_dialog():
	DialogueManager.show_example_dialogue_balloon(load("res://coast/dialog/lumberjackDialog.dialogue"),"start")
