extends Node2D

@onready var playerSpawner = $PlayerSpawner
@onready var ui = $CanvasLayer/UI

func _ready():
	playerSpawner.create_player(ui.get_joystick())
	if GlobalDialog.firstDialog:
		DialogueManager.show_example_dialogue_balloon(load("res://restaurant/dialog/initial_dialog.dialogue"),"initial_dialog")

func _on_reminder_body_entered(body):
	if body.get_name().contains("Player"):
		if GlobalDialog.firstBossMetting:
			DialogueManager.show_example_dialogue_balloon(load("res://restaurant/dialog/initial_dialog.dialogue"),"reminder")
		else:
			$Door.position.x = 0
